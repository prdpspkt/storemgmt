class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /demands
  # GET /demands.json
  def index
    @demands = current(Demand)
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    @demand_item = DemandItem.new
    @items = @demand.demand_items
  end

  # GET /demands/new
  def new
    @demand = Demand.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Demand.new(demand_params)
    @demand.recommended_by = Personnel.find(demand_params[:recommended_by]).name_ne
    @demand.ordered_by = current_control_body.office_chief_name
    @demand.recorded_by = current_control_body.store_keeper_name
    @demand.user_id = current_user.id
    @demand.office_id = current_office.id
    @demand.fiscal_year_id = current_fiscal_year.id
    @demand.demand_no = get_new_office_demand_no

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
        @demand.recommended_by = Personnel.find(demand_params[:recommended_by]).name_ne
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
    if(can_unmark(@demand))
      @demand.marked_as_final = false
      @demand.save
    else
      @demand.marked_as_final = true
      @demand.save
    end
    redirect_to demand_path(@demand)
  end

  private
  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:demand).permit(:demand_no, :demand_date, :demand_by, :recommended_by, :recommended_date, :needed_to_purchase, :ordered_date,  :recorded_date, :user_id, :fiscal_year, :office_id)
    end

    def get_new_office_demand_no
    @new_demand_no = 1
    @count = Demand.all.count
    if @count > 0
      @last_demand_no = Demand.last.demand_no
      if @last_demand_no.nil? == false
      @new_demand_no = @last_demand_no + 1
    end
    end
    @new_demand_no
  end
end
