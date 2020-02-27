class ProjectEvaluationsController < ApplicationController
  before_action :set_project_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /project_evaluations
  # GET /project_evaluations.json
  def index
    @project_evaluations = ProjectEvaluation.all
  end

  # GET /project_evaluations/1
  # GET /project_evaluations/1.json
  def show
  end

  # GET /project_evaluations/new
  def new
    @project_evaluation = ProjectEvaluation.new
  end

  # GET /project_evaluations/1/edit
  def edit
  end

  # POST /project_evaluations
  # POST /project_evaluations.json
  def create
    @project_evaluation = ProjectEvaluation.new(project_evaluation_params)

    respond_to do |format|
      if @project_evaluation.save
        format.html { redirect_to @project_evaluation, notice: 'Project evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @project_evaluation }
      else
        format.html { render :new }
        format.json { render json: @project_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_evaluations/1
  # PATCH/PUT /project_evaluations/1.json
  def update
    respond_to do |format|
      if @project_evaluation.update(project_evaluation_params)
        format.html { redirect_to @project_evaluation, notice: 'Project evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @project_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_evaluations/1
  # DELETE /project_evaluations/1.json
  def destroy
    @project_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to project_evaluations_url, notice: 'Project evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_evaluation
      @project_evaluation = ProjectEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_evaluation_params
      params.require(:project_evaluation).permit(:fy, :committee_formation_date, :report_submission_date, :office_id, :user_id, :fiscal_year_id, :marked_as_final)
    end
end
