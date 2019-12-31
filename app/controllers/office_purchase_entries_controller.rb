class OfficePurchaseEntriesController < ApplicationController
  before_action :set_office_entry, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /OfficePurchaseEntries
  # GET /OfficePurchaseEntries.json
  def index
    @office_purchase_entries = OfficePurchaseEntry.where(user_id: current_user.id, fiscal_year_id: current_fiscal_year.id, office_id: current_office.id)
    end


  # GET /OfficePurchaseEntries/1
  # GET /OfficePurchaseEntries/1.json
  def show
    @office_purchase_entry_item = OfficePurchaseEntryItem.new
    @office_purchase_entry_items = @office_purchase_entry.office_purchase_entry_items

  end

  # GET /OfficePurchaseEntries/new
  def new
    @office_purchase_entry = OfficePurchaseEntry.new
    @office_purchase_entry.entry_no = new_entry_no
  end

  # GET /OfficePurchaseEntries/1/edit
  def edit
  end

  # POST /OfficePurchaseEntries
  # POST /OfficePurchaseEntries.json
  def create
    @office_purchase_entry = OfficePurchaseEntry.new(office_entry_params)
    @office_purchase_entry.fiscal_year_id = current_fiscal_year.id
    @office_purchase_entry.user_id = current_user.id
    @office_purchase_entry.office_id = current_office.id
    @office_purchase_entry.fy = current_fiscal_year.fy
    @office_purchase_entry.entry_no = new_entry_no
    @office_purchase_entry.store_chief_name = current_control_body.store_keeper_name
    @office_purchase_entry.section_chief_name = current_control_body.section_chief_name
    @office_purchase_entry.office_chief_name = current_control_body.office_chief_name
    @office_purchase_entry.store_chief_designation = current_control_body.store_keeper_designation
    @office_purchase_entry.section_chief_designation = current_control_body.section_chief_degination
    @office_purchase_entry.office_chief_designation = current_control_body.office_chief_degination
    @office_purchase_entry.marked_as_final = false
    respond_to do |format|
      if @office_purchase_entry.save
        format.html { redirect_to @office_purchase_entry, notice: 'Office entry was successfully created.' }
        format.json { render :show, status: :created, location: @office_purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @office_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /OfficePurchaseEntries/1
  # PATCH/PUT /OfficePurchaseEntries/1.json
  def update
    respond_to do |format|
      if @office_purchase_entry.update(office_entry_params)
        format.html { redirect_to @office_purchase_entry, notice: 'Office entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_purchase_entry }
      else
        format.html { render :edit }
        format.json { render json: @office_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /OfficePurchaseEntries/1
  # DELETE /OfficePurchaseEntries/1.json
  def destroy
    @office_purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to office_purchase_entries_url, notice: 'Office entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if (can_unmark(@office_purchase_entry))
      @office_purchase_entry.marked_as_final = false
      @office_purchase_entry.save
    else
      @office_purchase_entry.marked_as_final = true
      @office_purchase_entry.save
    end
    redirect_to @office_purchase_entry
  end

  private
  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_office_entry
      @office_purchase_entry = OfficePurchaseEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_entry_params
      params.require(:office_purchase_entry).permit(:purchase_handover_no, :entry_date, :entry_no, :store_chief_signed_date,  :section_chief_signed_date, :office_chief_signed_date)
    end

  def new_entry_no
    loe = OfficePurchaseEntry.last
    if(!loe.blank? && loe.entry_no.present?)
      noeen = loe.entry_no + 1
    else
      noeen = 1
    end
    noeen
  end
end
