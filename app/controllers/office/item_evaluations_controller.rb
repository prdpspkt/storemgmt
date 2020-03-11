class Office::OfficeItemEvaluationsController < ApplicationController
  before_action :set_office_item_evaluation, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /office_item_evaluations
  # GET /office_item_evaluations.json
  def index
    @office_item_evaluations = OfficeItemEvaluation.all
  end

  # GET /office_item_evaluations/1
  # GET /office_item_evaluations/1.json
  def show
  end

  # GET /office_item_evaluations/new
  def new
    @office_item_evaluation = OfficeItemEvaluation.new
  end

  # GET /office_item_evaluations/1/edit
  def edit
  end

  # POST /office_item_evaluations
  # POST /office_item_evaluations.json
  def create
    @office_item_evaluation = OfficeItemEvaluation.new(office_item_evaluation_params)

    respond_to do |format|
      if @office_item_evaluation.save
        format.html { redirect_to @office_item_evaluation, notice: 'Office item evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @office_item_evaluation }
      else
        format.html { render :new }
        format.json { render json: @office_item_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_item_evaluations/1
  # PATCH/PUT /office_item_evaluations/1.json
  def update
    respond_to do |format|
      if @office_item_evaluation.update(office_item_evaluation_params)
        format.html { redirect_to @office_item_evaluation, notice: 'Office item evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_item_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @office_item_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_item_evaluations/1
  # DELETE /office_item_evaluations/1.json
  def destroy
    @office_item_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to office_item_evaluations_url, notice: 'Office item evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_item_evaluation
      @office_item_evaluation = OfficeItemEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_item_evaluation_params
      params.require(:office_item_evaluation).permit(:office_code, :fy, :committee_formation_date, :report_submission_date, :office_id, :user_id, :fiscal_year_id)
    end
end
