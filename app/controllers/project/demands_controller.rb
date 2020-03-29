class Project::DemandsController < ProjectController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :mark_as_final, :generate_release_form]
  load_and_authorize_resource except: [:create, :new]


  # GET /demands/1
  # GET /demands/1.json
  def show
    @demand_item = Project::DemandItem.new
    @demand_items = @demand.demand_items
    @items = Project::ProjectItemTransaction.where("sku > 0").where(transaction_type: 1)
  end


  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Project::Demand.new(demand_params)
    @demand.recommended_by = Office::Personnel.find(demand_params[:recommended_by]).name_ne
    @demand = set_current_information @demand
    @demand.store_body_id = current_control_body.id
    @demand.demand_no = get_new_project_demand_no
    @demand.marked_as_final = false
    @demand.entry_generated = false
    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render :new }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        @demand.recommended_by = Project::Personnel.find(demand_params[:recommended_by]).name_ne
        @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url, notice: 'Demand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    if @demand.marked_as_final == true
      @demand.marked_as_final = false
    else
      @demand.marked_as_final = true
    end
    @demand.save
    redirect_to project_demand_path(@demand)
  end

  def release
    @demand_items = @demand.demand_items
    @demand_items.each do |demand_item|
      trs = Project::ProjectItemTransaction.where(:project_id => @demand.project_id).where(project_item_id: demand_item.project_item_id)
      binding.pry
    end
  end

  def print
    @demand = Project::Demand.find(params[:id])
    @demand_items = @demand.demand_items
    @fy = Office::FiscalYear.find(@demand.fiscal_year_id).fy
    set_office_information
  end


  private


  # Use callbacks to share common setup or constraints between actions.
  def set_demand
    @demand = Project::Demand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def demand_params
    params.require(:project_demand).permit(:project_id, :demand_no, :demand_date, :demand_by, :recommended_by, :recommended_date, :needed_to_purchase, :ordered_date, :recorded_date)
  end

  def get_new_project_demand_no
    demand_no = 1
    @demands = current(Project::Demand)
    if @demands.count > 0
      demand_no = @demands.last.demand_no + 1
    end
    demand_no
  end

  def new_release_no
    nrn = 1
    @releases = current(Project::Release)
    if @releases.count > 0
      nrn = @releases.last.release_no + 1
    end
    nrn
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
  end
end
