class ProjectPurchaseOrdersController < ApplicationController
  before_action :set_project_purchase_order, only: [:show, :edit, :update, :destroy]

  # GET /project_purchase_orders
  # GET /project_purchase_orders.json
  def index
    @project_purchase_orders = ProjectPurchaseOrder.all
  end

  # GET /project_purchase_orders/1
  # GET /project_purchase_orders/1.json
  def show
    @project_purchase_order_item = ProjectPurchaseOrderItem.new
    @project_purchase_order_item.project_purchase_order_id = @project_purchase_order.id
    @project_purchase_order_items = @project_purchase_order.project_purchase_order_items
  end

  # GET /project_purchase_orders/new
  def new
    @project_purchase_order = ProjectPurchaseOrder.new
    @vendors = Vendor.where(fiscal_year_id: current_fiscal_year.id)
  end

  # GET /project_purchase_orders/1/edit
  def edit
    @vendors = Vendor.where(fiscal_year_id: current_fiscal_year.id)
  end

  # POST /project_purchase_orders
  # POST /project_purchase_orders.json
  def create
    @project_purchase_order = ProjectPurchaseOrder.new(project_purchase_order_params)
    @project_purchase_order = general_information @project_purchase_order
    @project_purchase_order = vendor_information @project_purchase_order
    respond_to do |format|
      if @project_purchase_order.save
        format.html { redirect_to @project_purchase_order, notice: 'Project purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_order }
      else
        format.html { render :new }
        format.json { render json: @project_purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_final

  end

  # PATCH/PUT /project_purchase_orders/1
  # PATCH/PUT /project_purchase_orders/1.json
  def update
    respond_to do |format|
      if @project_purchase_order.update(project_purchase_order_params)
        format.html { redirect_to @project_purchase_order, notice: 'Project purchase order was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @project_purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_purchase_orders/1
  # DELETE /project_purchase_orders/1.json
  def destroy
    @project_purchase_order.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_orders_url, notice: 'Project purchase order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_purchase_order
      @project_purchase_order = ProjectPurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_purchase_order_params
      params.require(:project_purchase_order).permit(:vendor_id, :order_no, :order_date, :order_decision_no, :order_decision_date, :office_name, :office_address, :store_chief_name, :store_chief_signed_date, :office_chief_name, :office_chief_signed_date, :section_chief_name, :section_cheif_signed_date, :user_id, :fy, :fiscal_year_signed_date, :office_id, :project_id, :marked_as_final)
    end

  def general_information object
    object.fiscal_year_id = current_fiscal_year.id
    object.user_id = current_user.id
    object.office_id = current_office.id
    object.fy = current_fiscal_year.fy
    object
  end

  def vendor_information object
    vendor = Vendor.find(object.vendor_id)
    object.vendor_name = vendor.vendor_name
    object.vendor_phone = vendor.vendor_phone
    object.vendor_address = vendor.vendor_address
    object.vendor_registration = vendor.vendor_registration
    object.vendor_pan = vendor.vendor_pan
    object
  end
end
