class ProjectHandoverFormsController < ApplicationController
  before_action :set_project_handover_form, only: [:show, :edit, :update, :destroy]

  # GET /project_handover_forms
  # GET /project_handover_forms.json
  def index
    @project_handover_forms = ProjectHandoverForm.all
  end

  # GET /project_handover_forms/1
  # GET /project_handover_forms/1.json
  def show
  end

  # GET /project_handover_forms/new
  def new
    @project_handover_form = ProjectHandoverForm.new
  end

  # GET /project_handover_forms/1/edit
  def edit
  end

  # POST /project_handover_forms
  # POST /project_handover_forms.json
  def create
    @project_handover_form = ProjectHandoverForm.new(project_handover_form_params)

    respond_to do |format|
      if @project_handover_form.save
        format.html { redirect_to @project_handover_form, notice: 'Project handover form was successfully created.' }
        format.json { render :show, status: :created, location: @project_handover_form }
      else
        format.html { render :new }
        format.json { render json: @project_handover_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_handover_forms/1
  # PATCH/PUT /project_handover_forms/1.json
  def update
    respond_to do |format|
      if @project_handover_form.update(project_handover_form_params)
        format.html { redirect_to @project_handover_form, notice: 'Project handover form was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_handover_form }
      else
        format.html { render :edit }
        format.json { render json: @project_handover_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_handover_forms/1
  # DELETE /project_handover_forms/1.json
  def destroy
    @project_handover_form.destroy
    respond_to do |format|
      format.html { redirect_to project_handover_forms_url, notice: 'Project handover form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_handover_form
      @project_handover_form = ProjectHandoverForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_handover_form_params
      params.require(:project_handover_form).permit(:decision_no, :decision_date, :fy, :handovered_project_name, :date, :form_no, :store_chief_name, :store_chief_designation, :store_chief_sign_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :office_id, :user_id, :fiscal_year_id, :marked_as_final)
    end
end
