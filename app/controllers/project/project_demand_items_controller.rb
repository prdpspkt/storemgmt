class ProjectDemandItemsController < ApplicationController
  before_action :set_project_demand_item, only: [:show, :edit, :update, :destroy]

  # GET /project_demand_items
  # GET /project_demand_items.json
  def index
    @project_demand_items = ProjectDemandItem.all
  end

  # GET /project_demand_items/1
  # GET /project_demand_items/1.json
  def show
  end

  # GET /project_demand_items/new
  def new
    @project_demand_item = ProjectDemandItem.new
    @demand_id = params[:demand_id]
  end

  # GET /project_demand_items/1/edit
  def edit
  end

  # POST /project_demand_items
  # POST /project_demand_items.json
  def create
    @project_demand_item = ProjectDemandItem.new(project_demand_item_params)

    @project_item = ProjectItem.find(project_demand_item_params[:project_item_id])
    @project_demand_item.name_of_item_ne = @project_item.name_of_item_ne
    @project_demand_item.name_of_item_en = @project_item.name_of_item_en
    @project_demand_item.specification = @project_item.specification
    @demand = Demand.find(@project_demand_item.demand_id)
    respond_to do |format|
      if @project_demand_item.save
        format.html { redirect_to @demand, notice: 'Demand item was successfully created.' }
        format.json { render :show, status: :created, location: @project_demand_item }
      else
        format.html { render :new }
        format.json { render json: @project_demand_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_demand_items/1
  # PATCH/PUT /project_demand_items/1.json
  def update
    respond_to do |format|
      if @project_demand_item.update(project_demand_item_params)
        format.html { redirect_to @project_demand_item, notice: 'Demand item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_demand_item }
      else
        format.html { render :edit }
        format.json { render json: @project_demand_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_demand_items/1
  # DELETE /project_demand_items/1.json
  def destroy
    @id = @project_demand_item.id
    @project_demand_item.destroy
    respond_to do |format|
      format.html { redirect_to project_demand_items_url, notice: 'Demand item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_demand_item
      @project_demand_item = ProjectDemandItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_demand_item_params
      params.require(:project_demand_item).permit(:name_of_item, :project_item_id, :specification, :rate, :unit, :quantity, :remark, :demand_id, :user_id, :office_id, :project_id, :fy, :fiscal_year_id)
    end
end
