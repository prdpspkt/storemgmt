class ProjectTenderBreakdownItemsController < ApplicationController
  before_action :set_project_tender_breakdown_item, only: [:show, :edit, :update, :destroy]

  # GET /project_tender_breakdown_items
  # GET /project_tender_breakdown_items.json
  def index
    @project_tender_breakdown_items = ProjectTenderBreakdownItem.all
  end

  # GET /project_tender_breakdown_items/1
  # GET /project_tender_breakdown_items/1.json
  def show
  end

  # GET /project_tender_breakdown_items/new
  def new
    @project_tender_breakdown_item = ProjectTenderBreakdownItem.new
  end

  # GET /project_tender_breakdown_items/1/edit
  def edit
  end

  # POST /project_tender_breakdown_items
  # POST /project_tender_breakdown_items.json
  def create
    @project_tender_breakdown_item = ProjectTenderBreakdownItem.new(project_tender_breakdown_item_params)
    @item = ProjectTenderItem.find(@project_tender_breakdown_item.project_tender_item_id)
    @project_tender_breakdown_item.rate = @item.rate
    @project_tender_breakdown_item.amount = @item.rate * @project_tender_breakdown_item.quantity
    @project_tender_breakdown_item.name_of_item_ne = @item.name_of_item_ne
    @project_tender_breakdown_item.unit_ne = @item.unit_ne
    @project_tender_breakdown_item.unit_en = @item.unit_en

    respond_to do |format|
      if @project_tender_breakdown_item.save
        format.html { redirect_to project_tender_breakdown_path(@project_tender_breakdown_item.project_tender_breakdown), notice: 'Project tender breakdown item was successfully created.' }
        format.json { render :show, status: :created, location: @project_tender_breakdown_item }
      else
        format.html { render :new }
        format.json { render json: @project_tender_breakdown_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /project_tender_breakdown_items/1
  # DELETE /project_tender_breakdown_items/1.json
  def destroy
    @project_tender_breakdown = @project_tender_breakdown_item.project_tender_breakdown
    @project_tender_breakdown_item.destroy
    respond_to do |format|
      format.html { redirect_to project_tender_breakdown_path(@project_tender_breakdown), notice: 'Project tender breakdown item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_tender_breakdown_item
      @project_tender_breakdown_item = ProjectTenderBreakdownItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_tender_breakdown_item_params
      params.require(:project_tender_breakdown_item).permit(:quantity, :project_tender_breakdown_id, :project_tender_item_id)
    end
end
