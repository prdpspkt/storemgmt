class ProjectPurchaseOrderItemsController < ApplicationController
  before_action :set_purchase_order_item, only: [:show, :edit, :update, :destroy]

  # GET /purchase_order_items
  # GET /purchase_order_items.json
  def index
    @purchase_order_items = PurchaseOrderItem.all
  end

  # GET /purchase_order_items/1
  # GET /purchase_order_items/1.json
  def show
  end

  # GET /purchase_order_items/new
  def new
    @purchase_order_item = PurchaseOrderItem.new
  end

  # GET /purchase_order_items/1/edit
  def edit
  end

  # POST /purchase_order_items
  # POST /purchase_order_items.json
  def create
    @purchase_order_item = PurchaseOrderItem.new(purchase_order_item_params)
    @purchase_order_item.amount = @purchase_order_item.rate * @purchase_order_item.quantity
    @item = Item.find(params[:purchase_order_item][:item_id]);
    @purchase_order_item.name_of_item_ne = @item.name_of_item_ne
    @purchase_order_item.name_of_item_en = @item.name_of_item_en
    @purchase_order_item.specification = @item.specification
    @purchase_order_item.unit_ne = @item.unit_ne
    @purchase_order_item.unit_en = @item.unit_en
    @purchase_order_item.user_id = current_user.id
    @purchase_order_item.project_id = current_project.id
    @purchase_order_item.fiscal_year_id = current_fiscal_year.id
    @purchase_order_item.fy = current_fiscal_year.fy
    @purchase_order = PurchaseOrder.find(params[:purchase_order_item][:purchase_order_id])
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
    @item = Item.find(params[:purchase_order_item][:item_id]);
    @purchase_order_item.amount = @purchase_order_item.rate * @purchase_order_item.quantity
    @purchase_order_item.name_of_item_ne = @item.name_of_item_ne
    @purchase_order_item.name_of_item_en = @item.name_of_item_en
    @purchase_order_item.specification = @item.specification
    @purchase_order_item.unit_ne = @item.unit_ne
    @purchase_order_item.unit_en = @item.unit_en
    @purchase_order = PurchaseOrder.find(params[:purchase_order_item][:purchase_order_id])
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
      format.html { redirect_to purchase_order_items_url, notice: 'Purchase order item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_item
      @purchase_order_item = PurchaseOrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_item_params
      params.require(:purchase_order_item).permit(:item_classification_no, :item_id,  :quantity, :rate, :remarks, :purchase_order_id)
    end
end
