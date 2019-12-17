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

    respond_to do |format|
      if @project_purchase_order_item.save
        format.html { redirect_to @project_purchase_order_item, notice: 'Project purchase order item was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_order_item }
      else
        format.html { render :new }
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
      params.require(:project_purchase_order_item).permit(:item_classification_no, :name_of_item_en, :name_of_item_ne, :specification, :unit_ne, :unit_en, :quantity, :rate, :amount, :remarks, :project_purchase_order_id, :office_id, :item_id, :fy, :fiscal_year_id, :project_id)
    end
end
