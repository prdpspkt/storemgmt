class Office::PurchaseEntryItemsController < ApplicationController
  before_action :set_office_purchase_entry_item, only: [:show, :edit, :update, :destroy]


  # GET /office_purchase_entry_items/1/edit
  def edit
  end

  # POST /office_purchase_entry_items
  # POST /office_purchase_entry_items.json
  def create
    @purchase_entry_item = Office::PurchaseEntryItem.new(office_purchase_entry_item_params)
    @purchase_entry_item = set_current_information @purchase_entry_item
    prepare_data
    respond_to do |format|
      if @purchase_entry_item.save
        format.html { redirect_to @purchase_entry_item.purchase_entry, notice: 'Office purchase entry item was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry_item }
      else
        format.html { redirect_to office_purchase_entry_path(Office::PurchaseEntry.find(@purchase_entry_item.purchase_entry_id))}
        format.json { render json: @purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_purchase_entry_items/1
  # PATCH/PUT /office_purchase_entry_items/1.json
  def update
    respond_to do |format|
      if @purchase_entry_item.update(office_purchase_entry_item_params)
        @purchase_entry_item.save
        format.html { redirect_to @purchase_entry_item.purchase_entry, notice: 'Office purchase entry item was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_entry_item }
      else
        format.html { render :edit }
        format.json { render json: @purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_purchase_entry_items/1
  # DELETE /office_purchase_entry_items/1.json
  def destroy
    @purchase_entry = @purchase_entry_item.purchase_entry
    @purchase_entry_item.destroy
    respond_to do |format|
      format.html { redirect_to @purchase_entry, notice: 'Office purchase entry item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_purchase_entry_item
    @purchase_entry_item = Office::PurchaseEntryItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_purchase_entry_item_params
    params.require(:office_purchase_entry_item).permit(:item_id, :is_vatable, :item_classification_no, :item_registration_page_no, :name_of_item, :specification, :item_identification_no, :model_no, :unit, :quantity, :rate, :amount_without_vat, :vat, :total_amount, :other_expense, :amount, :country, :size, :approx_age, :source, :remarks, :purchase_entry_id, :user_id, :office_id, :fy, :fiscal_year)
  end
  def prepare_data 
    @purchase_entry_item.amount_without_vat = @purchase_entry_item.rate * @purchase_entry_item.quantity
    if @purchase_entry_item.is_vatable
      @purchase_entry_item.vat = @purchase_entry_item.amount_without_vat * 0.13
      @purchase_entry_item.amount = @purchase_entry_item.amount_without_vat + @purchase_entry_item.vat
    else
      @purchase_entry_item.amount = @purchase_entry_item.amount_without_vat
    end
    if @purchase_entry_item.other_expense.present?
      @purchase_entry_item.total_amount = @purchase_entry_item.amount + @purchase_entry_item.other_expense
    else
      @purchase_entry_item.total_amount = @purchase_entry_item.amount
    end
  end
end
