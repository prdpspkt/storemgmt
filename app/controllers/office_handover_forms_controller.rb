class OfficeHandoverFormsController < ApplicationController
  before_action :set_handover_form, only: [:show, :edit, :update, :destroy]

  # GET /handover_forms
  # GET /handover_forms.json
  def index
    @handover_forms = HandoverForm.all
  end

  # GET /handover_forms/1
  # GET /handover_forms/1.json
  def show
  end

  # GET /handover_forms/new
  def new
    @handover_form = HandoverForm.new
  end

  # GET /handover_forms/1/edit
  def edit
  end

  # POST /handover_forms
  # POST /handover_forms.json
  def create
    @handover_form = HandoverForm.new(handover_form_params)

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
      format.html { redirect_to handover_forms_url, notice: 'Handover form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handover_form
      @handover_form = HandoverForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handover_form_params
      params.require(:handover_form).permit(:decision_date, :fy, :decision_no, :handovered_office_name, :date, :handover_form_no, :handover_store_chief_name, :handover_store_chief_designation, :handover_store_chief_signed_date, :handover_chief_name, :handover_chief_designation, :handover_chief_signed_date, :receiver_store_chief_name, :receiver_store_chief_designation, :receiver_store_chief_signed_date, :receiver_chief_name, :receiver_chief_desination, :receiver_chief_signed_date, :office_id, :user_id, :fiscal_year_id)
    end
end
