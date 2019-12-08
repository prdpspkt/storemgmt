class OfficeItemEntriesController < ApplicationController
  before_action :set_office_entry, only: [:show, :edit, :update, :destroy]

  # GET /OfficeItemEntries
  # GET /OfficeItemEntries.json
  def index
    @office_item_entries = OfficeItemEntry.all
  end

  # GET /OfficeItemEntries/1
  # GET /OfficeItemEntries/1.json
  def show
  end

  # GET /OfficeItemEntries/new
  def new
    @office_item_entry = OfficeItemEntry.new
  end

  # GET /OfficeItemEntries/1/edit
  def edit
  end

  # POST /OfficeItemEntries
  # POST /OfficeItemEntries.json
  def create
    @office_item_entry = OfficeItemEntry.new(office_entry_params)

    respond_to do |format|
      if @office_item_entry.save
        format.html { redirect_to @office_item_entry, notice: 'Office entry was successfully created.' }
        format.json { render :show, status: :created, location: @office_item_entry }
      else
        format.html { render :new }
        format.json { render json: @office_item_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /OfficeItemEntries/1
  # PATCH/PUT /OfficeItemEntries/1.json
  def update
    respond_to do |format|
      if @office_item_entry.update(office_entry_params)
        format.html { redirect_to @office_item_entry, notice: 'Office entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_item_entry }
      else
        format.html { render :edit }
        format.json { render json: @office_item_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /OfficeItemEntries/1
  # DELETE /OfficeItemEntries/1.json
  def destroy
    @office_item_entry.destroy
    respond_to do |format|
      format.html { redirect_to officeItemEntries_url, notice: 'Office entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_entry
      @office_item_entry = OfficeItemEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_entry_params
      params.require(:office_item_entry).permit(:item_registration_page_no, :office_item_id, :rate, :quantity, :amount, :user_id, :office_id, :fiscal_year_id)
    end
end
