class ProjectPurchaseOrderItemsController < ApplicationController
  before_action :set_project_purchase_order_item, only: [:show, :edit, :update, :destroy]

  # GET /project_purchase_order_items
  # GET /project_purchase_order_items.json
  def index
    @project_purchase_order_items = ProjectPurchaseOrderItem.all
  end

  # GET /project_purchase_order_items/1
  # GET /project_purchase_order_items/1.json
  def show
  end

  # GET /project_purchase_order_items/new
  def new
    @project_purchase_order_item = ProjectPurchaseOrderItem.new
  end

  # GET /project_purchase_order_items/1/edit
  def edit
  end

  # POST /project_purchase_order_items
  # POST /project_purchase_order_items.json
  def create
    @project_purchase_order_item = ProjectPurchaseOrderItem.new(project_purchase_order_item_params)
    @project_purchase_order_item = update_item_information @project_purchase_order_item
    @project_purchase_order_item = update_general_information @project_purchase_order_item
    @project_purchase_order_item.amount = (@project_purchase_order_item.rate * @project_purchase_order_item.quantity)*1.13
    @project_purchase_order =  ProjectPurchaseOrder.find(@project_purchase_order_item.project_purchase_order_id)
    respond_to do |format|
      if @project_purchase_order_item.save
        format.html { redirect_to @project_purchase_order, notice: 'Project purchase order item was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_order_item }
      else
        format.html { redirect_to @project_purchase_order }
        format.json { render json: @project_purchase_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_purchase_order_items/1
  # PATCH/PUT /project_purchase_order_items/1.json
  def update
    respond_to do |format|
      if @project_purchase_order_item.update(project_purchase_order_item_params)
        format.html { redirect_to @project_purchase_order_item, notice: 'Project purchase order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_order_item }
      else
        format.html { render :edit }
        format.json { render json: @project_purchase_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_purchase_order_items/1
  # DELETE /project_purchase_order_items/1.json
  def destroy
    @project_purchase_order_item.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_order_items_url, notice: 'Project purchase order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_purchase_order_item
    @project_purchase_order_item = ProjectPurchaseOrderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_purchase_order_item_params
    params.require(:project_purchase_order_item).permit(:item_classification_no, :name_of_item_en, :quantity, :rate, :amount, :remarks, :project_purchase_order_id, :item_id)
  end

  def update_item_information object
    item = Item.find(object.item_id)
    object.name_of_item_en = item.name_of_item_en
    object.name_of_item_ne = item.name_of_item_ne
    object.unit_ne = item.unit_ne
    object.unit_en = item.unit_en
    object.specification = item.specification
    object
  end

  def update_general_information object
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object.fy = current_fiscal_year.fy
    object
  end
end
