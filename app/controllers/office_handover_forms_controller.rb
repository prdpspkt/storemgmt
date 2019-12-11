class OfficeHandoverFormsController < ApplicationController
  before_action :set_handover_form, only: [:show, :edit, :update, :destroy]

  # GET /handover_forms
  # GET /handover_forms.json
  def index
    @handover_forms = OfficeHandoverForm.all
  end

  # GET /handover_forms/1
  # GET /handover_forms/1.json
  def show
    @handover_form_item = OfficeHandoverFormItem.new
  end

  # GET /handover_forms/new
  def new
    @handover_form = OfficeHandoverForm.new
    @handover_form.form_no = new_office_handover_no
  end

  # GET /handover_forms/1/edit
  def edit
  end

  # POST /handover_forms
  # POST /handover_forms.json
  def create
    @handover_form = OfficeHandoverForm.new(handover_form_params)
    @handover_form = prepare_data(@handover_form)
    respond_to do |format|
      if @handover_form.save
        format.html { redirect_to @handover_form, notice: 'Handover form was successfully created.' }
        format.json { render :show, status: :created, location: @handover_form }
      else
        format.html { render :new }
        format.json { render json: @handover_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /handover_forms/1
  # PATCH/PUT /handover_forms/1.json
  def update
    respond_to do |format|
      if @handover_form.update(handover_form_params)
        format.html { redirect_to @handover_form, notice: 'Handover form was successfully updated.' }
        format.json { render :show, status: :ok, location: @handover_form }
      else
        format.html { render :edit }
        format.json { render json: @handover_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handover_forms/1
  # DELETE /handover_forms/1.json
  def destroy
    @handover_form.destroy
    respond_to do |format|
      format.html { redirect_to office_handover_forms_url, notice: 'Handover form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handover_form
      @handover_form = OfficeHandoverForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handover_form_params
      params.require(:office_handover_form).permit(:decision_date, :decision_no, :handovered_office_name, :date, :form_no, :store_chief_signed_date, :office_chief_signed_date)
    end

  def new_office_handover_no
    ohf = OfficeHandoverForm.last
    if(ohf.blank? || ohf.form_no.present? == false)
      nohf =  1
    else
      nohf = ohf.form_no + 1;
    end
    nohf
  end


  def prepare_data hf
    hf.office_id = current_office.id
    hf.user_id = current_user.id
    hf.fy = current_fiscal_year.fy
    hf.fiscal_year_id = current_fiscal_year.id
    hf
  end
end
