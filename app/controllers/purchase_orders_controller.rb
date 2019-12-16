class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.where(user_id: current_user.id, office_id: current_office.id, fiscal_year_id: current_fiscal_year.id)
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    @purchase_order_item = PurchaseOrderItem.new
    @purchase_order_items = PurchaseOrderItem.where(purchase_order_id: @purchase_order.id)
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.order_no = new_purchase_order_no
    @vendors = Vendor.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id)
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @vendor = Vendor.find(params[:purchase_order][:vendor_id])
    @purchase_order.order_no = new_purchase_order_no
    @purchase_order.vendor_name = @vendor.vendor_name
    @purchase_order.vendor_address = @vendor.vendor_address
    @purchase_order.vendor_registration = @vendor.vendor_registration
    @purchase_order.vendor_pan = @vendor.vendor_pan
    @purchase_order.vendor_phone = @vendor.vendor_phone
    @purchase_order.office_cheif_name = current_office_chief.name_ne
    @purchase_order.section_chief_name = current_section_chief.name_ne
    @purchase_order.store_chief_name = current_store_keeper.name_ne
    @purchase_order.user_id = current_user.id
    @purchase_order.office_id = current_office.id
    @purchase_order.fiscal_year_id = current_fiscal_year.id
    @purchase_order.fy = current_fiscal_year.fy
    @purchase_order.office_name = current_office.office
    @purchase_order.office_address = current_office.address
    @purchase_order.marked_as_final = false

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    @vendor = Vendor.find(params[:purchase_order][:vendor_id])
    @purchase_order.vendor_name = @vendor.vendor_name
    @purchase_order.vendor_address = @vendor.vendor_address
    @purchase_order.vendor_registration = @vendor.vendor_registration
    @purchase_order.vendor_pan = @vendor.vendor_pan
    @purchase_order.vendor_phone = @vendor.vendor_phone
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if can_unmark(@purchase_order)
      @purchase_order.marked_as_final = false
      @purchase_order.save
    else
      @purchase_order.marked_as_final = true
      @purchase_order.save
    end
    redirect_to @purchase_order
  end

  private
  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:vendor_name, :vendor_address, :vendor_registration, :vendor_phone, :vendor_pan, :order_no, :order_date, :order_decision_no, :order_decision_date, :date_to_receive_goods, :office_name, :office_address, :store_chief_name, :store_chief_signed_date, :section_chief_name, :section_chief_signed_date, :office_cheif_signed_date, :office_cheif_name, :user_id, :fy, :fiscal_year_id, :office_id)
    end
  def new_purchase_order_no
    lpo = PurchaseOrder.last
    if(!(lpo.blank?) && lpo.order_no.present?)
      npon = lpo.order_no + 1
    else
      npon = 1
    end
    npon
  end
end
