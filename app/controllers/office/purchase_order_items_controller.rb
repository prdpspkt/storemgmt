class Office::PurchaseOrderItemsController < OfficeController
  before_action :set_purchase_order_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]

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
    @purchase_order_item.item_id = office_item(@purchase_order_item.pool_item_id).id
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

  # DELETE /purchase_order_items/1
  # DELETE /purchase_order_items/1.json
  def destroy
    @purchase_order = @purchase_order_item.purchase_order
    if @purchase_order_item.purchase_order.marked_as_final != true
      @id = @purchase_order_item.id
      @purchase_order_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to @purchase_order, notice: 'Purchase order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_order_item
    @purchase_order_item = Office::PurchaseOrderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_order_item_params
    params.require(:office_purchase_order_item).permit(:item_classification_no, :pool_item_id, :is_vatable, :quantity, :rate, :remarks, :purchase_order_id)
  end

  def office_item pool_item_id
    @office_item = current(Office::Item).where(pool_item_id: pool_item_id).first
    if @office_item.blank?
      pool_item = Office::PoolItem.find(pool_item_id)
      @office_item = Office::Item.new(pool_item.attributes.select { |key, _| Office::Item.column_names.include? key })
      @office_item.id = nil
      @office_item.pool_item_id = pool_item_id
      @office_item = set_current_information @office_item
      @office_item.item_register_page_no = office_item_register_page pool_item_id
      @office_item.save
    end
    @office_item
  end

  def office_item_register_page pool_item_id
    @page_no = 1
    @pool_item = Office::PoolItem.find(pool_item_id)
    if @pool_item.item_classification_no == 47
      @office_items = office(Office::Item)
    else
      @office_items = current(Office::Item)
    end
    if @office_items.count.positive?
      @page_no = @office_items.last.item_register_page_no + 1
    end
    @page_no
  end
end
