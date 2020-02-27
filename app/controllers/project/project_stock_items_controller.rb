class ProjectStockItemsController < ApplicationController
  before_action :set_project_stock_item, only: [:show, :edit, :update, :destroy]

  # GET /project_stock_items
  # GET /project_stock_items.json
  def index
    @project_stock_items = ProjectStockItem.all
  end

  # GET /project_stock_items/1
  # GET /project_stock_items/1.json
  def show
  end

  # GET /project_stock_items/new
  def new
    @project_stock_item = ProjectStockItem.new
  end

  # GET /project_stock_items/1/edit
  def edit
  end

  # POST /project_stock_items
  # POST /project_stock_items.json
  def create
    @project_stock_item = ProjectStockItem.new(project_stock_item_params)

    respond_to do |format|
      if @project_stock_item.save
        format.html { redirect_to @project_stock_item, notice: 'Project stock item was successfully created.' }
        format.json { render :show, status: :created, location: @project_stock_item }
      else
        format.html { render :new }
        format.json { render json: @project_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_stock_items/1
  # PATCH/PUT /project_stock_items/1.json
  def update
    respond_to do |format|
      if @project_stock_item.update(project_stock_item_params)
        format.html { redirect_to @project_stock_item, notice: 'Project stock item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_stock_item }
      else
        format.html { render :edit }
        format.json { render json: @project_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_stock_items/1
  # DELETE /project_stock_items/1.json
  def destroy
    @project_stock_item.destroy
    respond_to do |format|
      format.html { redirect_to project_stock_items_url, notice: 'Project stock item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_stock_item
      @project_stock_item = ProjectStockItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_stock_item_params
      params.require(:project_stock_item).permit(:item_register_page_no, :item_classification_no, :name_of_item_en, :name_of_item_ne, :unit_en, :unit_ne, :quantity, :rate, :amount, :physical_status, :remarks, :office_id, :project_id, :item_id, :user_id, :fiscal_year_id)
    end
end
