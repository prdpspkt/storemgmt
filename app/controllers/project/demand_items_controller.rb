class Office::DemandItemsController < ApplicationController
  before_action :set_demand_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /demand_items
  # GET /demand_items.json
  def index
    @demand_items = Office::DemandItem.all
  end

  # GET /demand_items/1
  # GET /demand_items/1.json
  def show
  end

  # GET /demand_items/new
  def new
    @demand_item = Office::DemandItem.new
    @demand_id = params[:demand_id]
  end

  # GET /demand_items/1/edit
  def edit
  end

  # POST /demand_items
  # POST /demand_items.json
  def create
    @demand_item = Office::DemandItem.new(demand_item_params)
    @office_item = Office::Item.find(demand_item_params[:item_id])
    @demand = Office::Demand.find(@demand_item.demand_id)
    respond_to do |format|
      if @demand_item.save
        format.html { redirect_to @demand, notice: 'Demand item was successfully created.' }
        format.json { render :show, status: :created, location: @demand_item }
      else
        format.html { render :new }
        format.json { render json: @demand_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demand_items/1
  # PATCH/PUT /demand_items/1.json
  def update
    respond_to do |format|
      if @demand_item.update(demand_item_params)
        format.html { redirect_to @demand_item, notice: 'Demand item was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand_item }
      else
        format.html { render :edit }
        format.json { render json: @demand_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demand_items/1
  # DELETE /demand_items/1.json
  def destroy
    @demand = @demand_item.demand
    @demand_item.destroy
    respond_to do |format|
      format.html { redirect_to @demand, notice: 'Demand item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand_item
      @demand_item = Office::DemandItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demand_item_params
      params.require(:office_demand_item).permit(:name_of_item, :item_id, :specification, :rate, :unit, :quantity, :remark, :demand_id, :user_id, :office_id, :fy, :fiscal_year_id)
    end
end
