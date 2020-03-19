class Project::DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :mark_as_final, :generate_release_form]
  load_and_authorize_resource except: [:create, :new]
  # GET /demands
  # GET /demands.json
  def index
    @demands = current(Project::Demand)
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    @demand_item = Project::DemandItem.new
    @items = @demand.demand_items
  end

  # GET /demands/new
  def new
    @demand = Project::Demand.new
  end

  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Project::Demand.new(demand_params)
    @demand.recommended_by = Project::Personnel.find(demand_params[:recommended_by]).name_ne
    @demand = set_current_information @demand
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

  def mark_as_final
    if @demand.marked_as_final == true
      @demand.marked_as_final = false
    else
      @demand.marked_as_final = true
    end
    @demand.save
    redirect_to office_demand_path(@demand)
  end
  def generate_release_form
    @release_form = Project::Release.new
    @release_form.received_by = @demand.demand_by
    @release_form.received_date = @demand.demand_date
    @release_form = set_current_information @release_form
    @release_form.store_body_id = current_control_body.id
    @release_form.marked_as_final = false
    @release_form.release_date = bs_today
    @release_form.release_no = new_release_no
    @release_form.demand_id = @demand.id
    @release_form.received_by = @demand.demand_by
    @release_form.received_date = bs_today
    @release_form.entry_generated = false
    @release_form.save
    create_release_items @release_form
    @demand.entry_generated = true
    @demand.save
    redirect_to @release_form
  end



  private
  def create_release_items release
    @demand_items = @demand.demand_items
    @demand_items.each do |item|
      item_transactions = office_item_transactions_with_stock item.item_id
      item_transactions.each do |it|
        if it.sku >= item.quantity
          release_item = Project::ReleaseItem.new(item.attributes.select{ |key, _| Project::ReleaseItem.column_names.include? key})
          release_item.id = nil
          release_item.release_id = release.id
          release_item = set_current_information release_item
          release_item.quantity = item.quantity
          release_item.rate = it.rate
          release_item.amount = release_item.quantity * release_item.rate
          it.sku = it.sku - item.quantity
          release_item.subed_from = it.id
          release_item.save
          it.save
          break
        else
          release_item = Project::ReleaseItem.new(item.attributes.select{ |key, _| Project::ReleaseItem.column_names.include? key})
          release_item.id = nil
          release_item.release_id = release.id
          release_item = set_current_information release_item
          release_item.quantity = it.sku
          release_item.rate = it.rate
          release_item.amount = release_item.quantity * release_item.rate
          item.quantity = item.quantity - it.sku
          release_item.subed_from = it.id
          release_item.save
          it.save
        end
      end

    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Project::Demand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_params
      params.require(:project_demand).permit(:demand_no, :demand_date, :demand_by, :recommended_by, :recommended_date, :needed_to_purchase, :ordered_date,  :recorded_date, :user_id, :fiscal_year, :office_id)
    end

    def get_new_office_demand_no
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

end
