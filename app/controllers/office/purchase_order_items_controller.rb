class Office::PurchaseOrderItemsController < ApplicationController
  before_action :set_purchase_order_item, only: [:show, :edit, :update, :destroy]


  # GET /purchase_order_items/1
  # GET /purchase_order_items/1.json
  def show
  end

  # GET /purchase_order_items/new
  def new
    @purchase_order_item = Office::PurchaseOrderItem.new
  end

  # GET /purchase_order_items/1/edit
  def edit
  end

  # POST /purchase_order_items
  # POST /purchase_order_items.json
  def create
    @purchase_order_item = Office::PurchaseOrderItem.new(purchase_order_item_params)
    @purchase_order_item.amount_without_vat = @purchase_order_item.rate * @purchase_order_item.quantity
    if @purchase_order_item.is_vatable == true
      @purchase_order_item.vat = @purchase_order_item.amount_without_vat * 0.13
      @purchase_order_item.amount = @purchase_order_item.amount_without_vat * 1.13
    else
      @purchase_order_item.amount = @purchase_order_item.amount_without_vat
    end
    @purchase_order_item.amount_without_vat = @purchase_order_item.rate * @purchase_order_item.quantity
    @purchase_order_item.user_id = current_user.id
    @purchase_order_item.office_id = current_office.id
    @purchase_order_item.fiscal_year_id = current_fiscal_year.id
    @purchase_order_item.fy = current_fiscal_year.fy
    @purchase_order = Office::PurchaseOrder.find(@purchase_order_item.purchase_order_id)
    respond_to do |format|

      if @purchase_order_item.save
        format.html { redirect_to @purchase_order, notice: 'Purchase order item was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order_item }
      else
        format.html { render :new }
        format.json { render json: @purchase_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_order_items/1
  # PATCH/PUT /purchase_order_items/1.json
  def update
    @purchase_order = Office::PurchaseOrder.find(@purchase_order_item.purchase_order_id)
    @purchase_order_item.amount_without_vat = @purchase_order_item.rate * @purchase_order_item.quantity
    if @purchase_order_item.is_vatable == true
      @purchase_order_item.vat = @purchase_order_item.amount_without_vat * 0.13
      @amount = @purchase_order_item.amount_without_vat * 1.13
    else
      @amount = @purchase_order_item.amount_without_vat
    end
    respond_to do |format|
      if @purchase_order_item.update(purchase_order_item_params)
        format.html { redirect_to @purchase_order, notice: 'Purchase order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_item }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_items/1
  # DELETE /purchase_order_items/1.json
  def destroy
    if @purchase_order_item.purchase_order.marked_as_final != true
    @id = @purchase_order_item.id
    @purchase_order_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to office_purchase_order_items_url, notice: 'Purchase order item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_item
      @purchase_order_item = Office::PurchaseOrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_item_params
      params.require(:office_purchase_order_item).permit(:item_classification_no, :office_item_id, :is_vatable, :quantity, :rate, :remarks, :purchase_order_id)
    end
end
