class Office::DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :mark_as_final, :generate_ledger_entry]

  # GET /demands
  # GET /demands.json
  def index
    @demands = current(Office::Demand)
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    @demand_item = Office::DemandItem.new
    @items = @demand.demand_items
  end

  # GET /demands/new
  def new
    @demand = Office::Demand.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Office::Demand.new(demand_params)
    @demand.recommended_by = Office::Personnel.find(demand_params[:recommended_by]).name_ne
    @demand.ordered_by = current_control_body.office_chief_name
    @demand.recorded_by = current_control_body.store_keeper_name
    @demand.user_id = current_user.id
    @demand.office_id = current_office.id
    @demand.fiscal_year_id = current_fiscal_year.id
    @demand.demand_no = get_new_office_demand_no
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
        @demand.recommended_by = Office::Personnel.find(demand_params[:recommended_by]).name_ne
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

  def mark_as_final
    if @demand.marked_as_final == true
      @demand.marked_as_final = false
    else
      @demand.marked_as_final = true
    end
    @demand.save
    redirect_to office_demand_path(@demand)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Office::Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:office_demand).permit(:demand_no, :demand_date, :demand_by, :recommended_by, :recommended_date, :needed_to_purchase, :ordered_date,  :recorded_date, :user_id, :fiscal_year, :office_id)
    end

    def get_new_office_demand_no
    demand_no = 1
    @demands = current(Office::Demand)
    if @demands.count > 0
      demand_no = @demands.last.demand_no + 1
    end
    demand_no
  end
end
