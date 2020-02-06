class ProjectDemandsController < ApplicationController
  before_action :set_project_demand, only: [:show, :edit, :update, :destroy]

  # GET /project_demands
  # GET /project_demands.json
  def index
    @project_demands = ProjectDemand.all
  end

  # GET /project_demands/1
  # GET /project_demands/1.json
  def show
    @project_demand_item = ProjectDemandItem.new
    @project_demand_item.project_demand_id = @project_demand.id
  end

  # GET /project_demands/new
  def new
    @project_demand = ProjectDemand.new
    @projects = current_office.projects
  end

  # GET /project_demands/1/edit
  def edit
    @projects = current_office.projects
  end

  # POST /project_demands
  # POST /project_demands.json
  def create
    @project_demand = ProjectDemand.new(project_demand_params)
    if !@project_demand.demand_no.present?
      @project_demand.demand_no = new_demand_no @project_demand.project_id
    end

    respond_to do |format|
      if @project_demand.save
        format.html { redirect_to @project_demand, notice: 'Project demand was successfully created.' }
        format.json { render :show, status: :created, location: @project_demand }
      else
        format.html { render :new }
        format.json { render json: @project_demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_demands/1
  # PATCH/PUT /project_demands/1.json
  def update
    respond_to do |format|
      if @project_demand.update(project_demand_params)
        format.html { redirect_to @project_demand, notice: 'Project demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_demand }
      else
        format.html { render :edit }
        format.json { render json: @project_demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_demands/1
  # DELETE /project_demands/1.json
  def destroy
    @project_demand.destroy
    respond_to do |format|
      format.html { redirect_to project_demands_url, notice: 'Project demand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_demand
    @project_demand = ProjectDemand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_demand_params
    params.require(:project_demand).permit(:demand_no, :demand_date, :demand_by, :recommended_by, :needed_to_purchase, :ordered_by, :ordered_date, :recorded_by, :recorded_date, :user_id, :fiscal_year_id, :office_id, :project_id, :item_id, :marked_as_final)
  end

  def new_demand_no project_id
    project_demand_no = 1
    @project_demands = ProjectDemand.where(project_id: project_id)
    if !@project_demands.blank?
      project_demand_no = @project_demands.last.demand_no + 1
    end
    project_demand_no
  end
end
