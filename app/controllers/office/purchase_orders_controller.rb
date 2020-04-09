class Office::PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy, :accept, :entry, :print]
  before_action :set_office_information
  load_and_authorize_resource except: [:create, :new]
  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = current(Office::PurchaseOrder)
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    @purchase_order_item = Office::PurchaseOrderItem.new
    @purchase_order_items = Office::PurchaseOrderItem.where(purchase_order_id: @purchase_order.id)
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = Office::PurchaseOrder.new
    @purchase_order.order_no = new_purchase_order_no
    @vendors = current(Office::Vendor)
  end

  # GET /purchase_orders/1/edit
  def edit
    @vendors = current(Office::Vendor)
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = Office::PurchaseOrder.new(purchase_order_params)
    @vendor = Office::Vendor.find(@purchase_order.vendor_id)
    @purchase_order.user_id = current_user.id
    @purchase_order.office_id = current_office.id
    @purchase_order.fiscal_year_id = current_fiscal_year.id
    @purchase_order.store_body_id = current_control_body.id
    @purchase_order.marked_as_final = false
    @purchase_order.entry_generated = false
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
      format.html { redirect_to office_purchase_orders_url, notice: 'Purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    if can_unmark(@purchase_order)
      @purchase_order.marked_as_final = false
    else
      @purchase_order.marked_as_final = true
    end
    @purchase_order.save
    redirect_to @purchase_order
  end

  def entry
    if @purchase_order.marked_as_final == true
      purchase_entry = create_purchase_entry @purchase_order
      items = @purchase_order.purchase_order_items
      items.each do |item|
        entry_item = Office::PurchaseEntryItem.new(item.attributes.select { |key, _| Office::PurchaseEntryItem.column_names.include? key })
        entry_item.id = nil
        entry_item.purchase_entry_id = purchase_entry.id
        entry_item.total_amount = item.amount
        entry_item.save
      end
      @purchase_order.entry_generated = true
      @purchase_order.save
    end
    redirect_to purchase_entry
  end

  def print
    @purchase_order_items = @purchase_order.purchase_order_items
    @fiscal_year = @purchase_order.fiscal_year
    @office = @purchase_order.office
    @report_name = "खरिद आदेश"
    @old_form_no = 45
    @form_no = 402
    @amount = @purchase_order_items.sum(:amount)
    @vat = @amount * 0.13
    @total = @amount + @vat
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "purchase_order", layout: "pdf_print", margin: {left: "25mm"}
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_order
    @purchase_order = Office::PurchaseOrder.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_order_params
    params.require(:office_purchase_order).permit(:vendor_name, :vendor_address, :vendor_registration, :vendor_phone, :vendor_pan, :order_no, :order_date, :order_decision_no, :order_decision_date, :date_to_receive_goods, :office_name, :office_address, :store_chief_name, :store_chief_signed_date, :section_chief_name, :section_chief_signed_date, :office_cheif_signed_date, :office_cheif_name, :user_id, :fy, :fiscal_year_id, :vendor_id, :office_id)
  end

  def new_purchase_order_no
    pos = current(Office::PurchaseOrder)
    npon = 1
    if pos.count > 0
      npon = pos.last.order_no + 1
    end
    npon
  end

  def create_purchase_entry purchase_order
    purchase_entry = Office::PurchaseEntry.new
    purchase_entry.entry_no = purchase_entry_no
    purchase_entry.entry_date = bs_today
    purchase_entry.purchase_handover_no = purchase_order.order_no
    purchase_entry = set_current_information purchase_entry
    purchase_entry = set_signed_date_information_today purchase_entry
    purchase_entry.store_body_id = current_control_body.id
    purchase_entry.purchase_order_id = purchase_order.id
    purchase_entry.marked_as_final = false
    purchase_entry.ledger_entry_generated = false
    purchase_entry.generated_from = "purchase_order"
    purchase_entry.save
    purchase_entry
  end

  def purchase_entry_no
    purchase_entries = current(Office::PurchaseEntry)
    purchase_entry_no = 1
    if purchase_entries.count > 0
      purchase_entry_no = purchase_entries.last.entry_no + 1
    end
    purchase_entry_no
  end

  def set_signed_date_information_today object
    object.store_chief_signed_date = bs_today
    object.section_chief_signed_date = bs_today
    object.office_chief_signed_date = bs_today
    object
  end

  def set_office_information
    @office = current_office
  end
end
