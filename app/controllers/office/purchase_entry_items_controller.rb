class Office::OfficePurchaseEntryItemsController < ApplicationController
  before_action :set_office_purchase_entry_item, only: [:show, :edit, :update, :destroy]

  # GET /office_purchase_entry_items
  # GET /office_purchase_entry_items.json
  def index
    @office_purchase_entry_items = OfficePurchaseEntryItem.all
  end

  # GET /office_purchase_entry_items/1
  # GET /office_purchase_entry_items/1.json
  def show
  end

  # GET /office_purchase_entry_items/new
  def new
    @office_purchase_entry_item = OfficePurchaseEntryItem.new
  end

  # GET /office_purchase_entry_items/1/edit
  def edit
  end

  # POST /office_purchase_entry_items
  # POST /office_purchase_entry_items.json
  def create
    @office_purchase_entry_item = OfficePurchaseEntryItem.new(office_purchase_entry_item_params)
    @office_purchase_entry_item.user_id = current_user.id
    @office_purchase_entry_item.fy = current_fiscal_year.fy
    @office_purchase_entry_item.fiscal_year_id = current_fiscal_year.id
    @office_purchase_entry_item.office_id = current_office.id
    respond_to do |format|
      if @office_purchase_entry_item.save
        format.html { redirect_to "/office_purchase_entries/#{@office_purchase_entry_item.office_purchase_entry.id}", notice: 'Office purchase entry item was successfully created.' }
        format.json { render :show, status: :created, location: @office_purchase_entry_item }
      else
        format.html { render :new }
        format.json { render json: @office_purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_purchase_entry_items/1
  # PATCH/PUT /office_purchase_entry_items/1.json
  def update
    respond_to do |format|
      if @office_purchase_entry_item.update(office_purchase_entry_item_params)
        @office_purchase_entry_item = prepare_data(@office_purchase_entry_item)
        @office_purchase_entry_item.save
        format.html { redirect_to "/office_purchase_entries/#{@office_purchase_entry_item.office_purchase_entry.id}", notice: 'Office purchase entry item was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_purchase_entry_item }
      else
        format.html { render :edit }
        format.json { render json: @office_purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_purchase_entry_items/1
  # DELETE /office_purchase_entry_items/1.json
  def destroy
    @id = @office_purchase_entry_item.id
    @office_purchase_entry_item.destroy
    respond_to do |format|
      format.html { redirect_to office_purchase_entry_items_url, notice: 'Office purchase entry item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_purchase_entry_item
    @office_purchase_entry_item = OfficePurchaseEntryItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_purchase_entry_item_params
    params.require(:office_purchase_entry_item).permit(:item_id, :is_vatable, :item_classification_no, :item_registration_page_no, :name_of_item, :specification, :item_identification_no, :model_no, :unit, :quantity, :rate, :amount_without_vat, :vat, :total_amount, :other_expense, :amount, :country, :size, :approx_age, :source, :remarks, :office_purchase_entry_id, :user_id, :office_id, :fy, :fiscal_year)
  end

end
