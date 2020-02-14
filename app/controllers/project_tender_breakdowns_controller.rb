class ProjectTenderBreakdownsController < ApplicationController
  before_action :set_project_tender_breakdown, only: [:show, :edit, :update, :destroy, :marked_as_final]

  # GET /project_tender_breakdowns
  # GET /project_tender_breakdowns.json
  def index
    @project_tender_breakdowns = current_office.project_tender_breakdowns
  end

  # GET /project_tender_breakdowns/1
  # GET /project_tender_breakdowns/1.json
  def show
    @project_tender_breakdown_item = ProjectTenderBreakdownItem.new
    @project_tender_breakdown_item.project_tender_breakdown_id = @project_tender_breakdown.id
    @project_tender_breakdown_items = @project_tender_breakdown.project_tender_breakdown_items
  end

  # GET /project_tender_breakdowns/new
  def new
    @project_tender_breakdown = ProjectTenderBreakdown.new
    @purchase_entries = ProjectPurchaseEntry.where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id).where(marked_as_final: true)
  end

  # GET /project_tender_breakdowns/1/edit
  def edit
  end

  # POST /project_tender_breakdowns
  # POST /project_tender_breakdowns.json
  def create
    @project_tender_breakdown = ProjectTenderBreakdown.new(project_tender_breakdown_params)
    @project_tender_breakdown = update_tender_and_project_information(@project_tender_breakdown)
    @project_tender_breakdown = update_general_information(@project_tender_breakdown)

    respond_to do |format|
      if @project_tender_breakdown.save
        format.html { redirect_to @project_tender_breakdown, notice: 'Project tender breakdown was successfully created.' }
        format.json { render :show, status: :created, location: @project_tender_breakdown }
      else
        format.html { render :new }
        format.json { render json: @project_tender_breakdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tender_breakdowns/1
  # PATCH/PUT /project_tender_breakdowns/1.json
  def update
    @project_tender_breakdown = update_tender_and_project_information(@project_tender_breakdown)
    respond_to do |format|
      if @project_tender_breakdown.update(project_tender_breakdown_params)
        format.html { redirect_to @project_tender_breakdown, notice: 'Project tender breakdown was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_tender_breakdown }
      else
        format.html { render :edit }
        format.json { render json: @project_tender_breakdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_tender_breakdowns/1
  # DELETE /project_tender_breakdowns/1.json
  def destroy
    @project_tender_breakdown.destroy
    respond_to do |format|
      format.html { redirect_to project_tender_breakdowns_url, notice: 'Project tender breakdown was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def marked_as_final
    if @project_tender_breakdown.marked_as_final.present? || @project_tender_breakdown.marked_as_final  != false
      @project_tender_breakdown.marked_as_final = false
      @project_tender_breakdown.project_tender_breakdown_items.each do |ptbi|
        ptbi.peirt.destroy
      end
    else
      @project_tender_breakdown.marked_as_final = true
    end
    @project_tender_breakdown.save
    redirect_to @project_tender_breakdown, notice: "Item successfully updated"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_tender_breakdown
    @project_tender_breakdown = ProjectTenderBreakdown.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_tender_breakdown_params
    params.require(:project_tender_breakdown).permit( :project_purchase_entry_id, :project_id)
  end

  def update_general_information object
    object.marked_as_final = false
    object.fiscal_year_id = current_office.active_fiscal_year.fiscal_year_id
    object.office_id = current_office.id
    object.user_id = current_user.id
    object.fy = current_fiscal_year.fy
    object
  end

  def update_tender_and_project_information object
    project = Project.find(object.project_id)
    object.project_name_ne = project.name_of_project_ne
    object.project_name_en = project.name_of_project_en
    object
  end
end
