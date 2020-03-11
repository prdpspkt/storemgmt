class Office::ReleasesController < ApplicationController
  before_action :set_office_release, only: [:generate_ledger_entry, :mark_as_final, :show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /office_releases
  # GET /office_releases.json
  def index
    @office_releases = current(Office::Release)
  end

  # GET /office_releases/1
  # GET /office_releases/1.json
  def show
    @office_release_items = @office_release.release_items
  end

  def edit

  end

  def update
   @office_release.update(release_params)
   redirect_to @office_release
  end

  # GET /office_releases/new
  def destroy
    @office_release.destroy
    respond_to do |format|
      format.html { redirect_to office_releases_url, notice: 'Office release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if @office_release.marked_as_final == true
      @office_release.marked_as_final = false
      @office_release.save
    else
      @office_release.marked_as_final = true
      @office_release.save
    end
    redirect_to @office_release
  end

  def generate_ledger_entry
    @items = @office_release.release_items
    @items.each do |item|
      item_transaction = Office::ItemTransaction.new(item.attributes.select{|key, _| Office::ItemTransaction.column_names.include? key})
      item_transaction.transaction_type = -1
      item_transaction.id = nil
      item_transaction.transaction_date = item.release.release_date
      item_transaction.entry_no = item.release.release_no
      item_transaction.release_item_id = item.id
      item_transaction.save
      @office_release.entry_generated = true
      @office_release.save
      item.item_transaction_id = item_transaction.id
      item.save
      redirect_to @office_release
    end

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_office_release
      @office_release = Office::Release.find(params[:id])
    end
  def release_params
    params.required(:office_release).permit(:id, :received_by, :store_keeper_signed_date, :office_chief_signed_date)
  end
end
