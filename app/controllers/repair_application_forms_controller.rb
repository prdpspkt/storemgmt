class RepairApplicationFormsController < ApplicationController
  before_action :set_repair_application_form, only: [:show, :edit, :update, :destroy]

  # GET /repair_application_forms
  # GET /repair_application_forms.json
  def index
    @repair_application_forms = RepairApplicationForm.all
  end

  # GET /repair_application_forms/1
  # GET /repair_application_forms/1.json
  def show
  end

  # GET /repair_application_forms/new
  def new
    @repair_application_form = RepairApplicationForm.new
  end

  # GET /repair_application_forms/1/edit
  def edit
  end

  # POST /repair_application_forms
  # POST /repair_application_forms.json
  def create
    @repair_application_form = RepairApplicationForm.new(repair_application_form_params)

    respond_to do |format|
      if @repair_application_form.save
        format.html { redirect_to @repair_application_form, notice: 'Repair application form was successfully created.' }
        format.json { render :show, status: :created, location: @repair_application_form }
      else
        format.html { render :new }
        format.json { render json: @repair_application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_application_forms/1
  # PATCH/PUT /repair_application_forms/1.json
  def update
    respond_to do |format|
      if @repair_application_form.update(repair_application_form_params)
        format.html { redirect_to @repair_application_form, notice: 'Repair application form was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_application_form }
      else
        format.html { render :edit }
        format.json { render json: @repair_application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_application_forms/1
  # DELETE /repair_application_forms/1.json
  def destroy
    @repair_application_form.destroy
    respond_to do |format|
      format.html { redirect_to repair_application_forms_url, notice: 'Repair application form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_application_form
      @repair_application_form = RepairApplicationForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_application_form_params
      params.require(:repair_application_form).permit(:application_no, :date, :year, :month, :vendor_name,  :within_date, :section_chief_signed_date, :technical_person_name, :technical_person_designation, :technical_person_signed_date,  :office_chief_signed_date)
    end
end
