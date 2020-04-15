class Office::RepairApplicationFormsController < OfficeController
  before_action :set_repair_application_form, only: [:show, :edit, :update, :destroy, :print]
  before_action :set_office_for_printing, only: [:print]
  load_and_authorize_resource except: [:create, :new]
  # GET /repair_application_forms
  # GET /repair_application_forms.json
  def index
    @repair_application_forms = Office::RepairApplicationForm.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id)
  end

  # GET /repair_application_forms/1
  # GET /repair_application_forms/1.json
  def show
    @repair_application_form_items = @repair_application_form.repair_application_form_items
    @repair_application_form_item =  Office::RepairApplicationFormItem.new
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 47).where("sku > 0")
  end

  # GET /repair_application_forms/new
  def new
    @repair_application_form =  Office::RepairApplicationForm.new
    @repair_application_form.application_no = new_repair_application_no
  end

  # GET /repair_application_forms/1/edit
  def edit
  end

  # POST /repair_application_forms
  # POST /repair_application_forms.json
  def create
    @repair_application_form =  Office::RepairApplicationForm.new(repair_application_form_params)
    @repair_application_form = update_general_information @repair_application_form
    @repair_application_form.application_no = new_repair_application_no

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

  def print
    @repair_application_form_items = @repair_application_form.repair_application_form_items
    @office = @repair_application_form.office
    @fiscal_year = @repair_application_form.fiscal_year
    @report_name = "मर्मत, संरक्षण आवेदन फाराम"
    @form_no = 414
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "repair_application_form", layout: "pdf_print"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_application_form
      @repair_application_form =  Office::RepairApplicationForm.find(params[:id])
    end
  def set_office_for_printing
    @office = @repair_application_form.office
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_application_form_params
      params.require(:office_repair_application_form).permit(:application_no, :date, :year, :month, :within_date, :section_chief_signed_date, :technical_person_name, :technical_person_designation, :vendor_id, :technical_person_signed_date,  :office_chief_signed_date)
    end


  def update_general_information repair_application_form
    repair_application_form = set_current_information repair_application_form
    repair_application_form.store_body_id = current_control_body.id
    repair_application_form
  end

  def new_repair_application_no
    repair_application =  Office::RepairApplicationForm.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id).last
    if !(repair_application.blank?) && repair_application.application_no.present?
      repair_application_no = repair_application.application_no + 1
    else
      repair_application_no =  1
    end
    repair_application_no
  end
end
