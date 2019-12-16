class ProjectItemEvaluationsController < ApplicationController
  before_action :set_project_item_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /project_item_evaluations
  # GET /project_item_evaluations.json
  def index
    @project_item_evaluations = ProjectItemEvaluation.all
  end

  # GET /project_item_evaluations/1
  # GET /project_item_evaluations/1.json
  def show
  end

  # GET /project_item_evaluations/new
  def new
    @project_item_evaluation = ProjectItemEvaluation.new
  end

  # GET /project_item_evaluations/1/edit
  def edit
  end

  # POST /project_item_evaluations
  # POST /project_item_evaluations.json
  def create
    @project_item_evaluation = ProjectItemEvaluation.new(project_item_evaluation_params)

    respond_to do |format|
      if @project_item_evaluation.save
        format.html { redirect_to @project_item_evaluation, notice: 'Project item evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @project_item_evaluation }
      else
        format.html { render :new }
        format.json { render json: @project_item_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_item_evaluations/1
  # PATCH/PUT /project_item_evaluations/1.json
  def update
    respond_to do |format|
      if @project_item_evaluation.update(project_item_evaluation_params)
        format.html { redirect_to @project_item_evaluation, notice: 'Project item evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_item_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @project_item_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_item_evaluations/1
  # DELETE /project_item_evaluations/1.json
  def destroy
    @project_item_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to project_item_evaluations_url, notice: 'Project item evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_item_evaluation
      @project_item_evaluation = ProjectItemEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_item_evaluation_params
      params.require(:project_item_evaluation).permit(:project_code, :fy, :committee_formation_date, :report_submission_date, :project_id, :user_id, :fiscal_year_id)
    end
end
