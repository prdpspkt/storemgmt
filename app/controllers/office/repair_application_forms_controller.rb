class Office::RepairApplicationFormsController < OfficeController
  before_action :set_repair_application_form, only: [:show, :edit, :update, :destroy, :print, :accept, :complete]
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
    @repair_application_form_item = Office::RepairApplicationFormItem.new
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 47).where("sku > 0")
    @personnels = office(Office::Personnel).where(working: true)
  end

  # GET /repair_application_forms/new
  def new
    @repair_application_form = Office::RepairApplicationForm.new
    @repair_application_form.application_no = new_repair_application_no
  end

  # GET /repair_application_forms/1/edit
  def edit
  end

  # POST /repair_application_forms
  # POST /repair_application_forms.json
  def create
    @repair_application_form = Office::RepairApplicationForm.new(repair_application_form_params)
    @repair_application_form = update_general_information @repair_application_form
    @repair_application_form.application_no = new_repair_application_no
    @repair_application_form.accepted = false
    @repair_application_form.completed = false

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

  def accept
    if @repair_application_form.accepted == true
      @repair_application_form.accepted = false
    else
      @repair_application_form.accepted = true
    end
    @repair_application_form.save
    redirect_to @repair_application_form, notice: "Operation Successful."
  end


  def complete
    @items = @repair_application_form.repair_application_form_items
    @items.each do |item|
      register = create_repair_record_register item
      record_item = Office::RepairRecordRegisterItem.new(item.attributes.select { |key, value| Office::RepairRecordRegisterItem.column_names.include? key })
      record_item.id = nil
      record_item.repair_record_register_id = register.id
      record_item.vendor_id = @repair_application_form.vendor_id
      record_item.applicant_name = item.personnel.name_ne
      record_item.date = item.repaired_date
      tecord_item = set_current_information record_item
      if item.other_expense_cost.present?
      record_item.total_expense = item.changed_part_cost + item.other_expense_cost
      else
        record_item.total_expense = item.changed_part_cost
      end
      record_item.repair_application_no = @repair_application_form.application_no
      record_item.save!
    end
    @repair_application_form.completed = true
    @repair_application_form.save
    redirect_to @repair_application_form, notice: "विवरण सफलतापुर्वक अभिलेखीकरण गरियो |"
  end

  # DELETE /repair_application_forms/1
  # DELETE /repair_application_forms/1.json
  def destroy
    @repair_application_form.destroy
    respond_to do |format|
      format.html { redirect_to office_repair_application_forms_url, notice: 'Repair application form was successfully destroyed.' }
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
    @repair_application_form = Office::RepairApplicationForm.find(params[:id])
  end

  def set_office_for_printing
    @office = @repair_application_form.office
  end

  def set_repaired_record
    @repair_application_form_item = Office::RepairApplicationFormItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def repair_application_form_params
    params.require(:office_repair_application_form).permit(:date,
                                                           :year,
                                                           :month,
                                                           :within_date,
                                                           :section_chief_signed_date,
                                                           :technical_person_name,
                                                           :technical_person_designation,
                                                           :vendor_id,
                                                           :technical_person_signed_date,
                                                           :office_chief_signed_date)
  end

  def update_general_information repair_application_form
    repair_application_form = set_current_information repair_application_form
    repair_application_form.store_body_id = current_control_body.id
    repair_application_form
  end

  def new_repair_application_no
    repair_application = Office::RepairApplicationForm.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id).last
    if !(repair_application.blank?) && repair_application.application_no.present?
      repair_application_no = repair_application.application_no + 1
    else
      repair_application_no = 1
    end
    repair_application_no
  end

  def create_repair_record_register item
    office_id = current_office.id
    fiscal_year_id = current_fiscal_year.id
    register = Office::RepairRecordRegister.first_or_create(office_id: office_id, item_transaction_id: item.item_transaction_id, fiscal_year_id: fiscal_year_id, item_id: item.item_id) do |register|
      register.user_id = current_user.id
      register.store_body_id = current_control_body.id
      register.page_no = new_page_no
    end
    register
  end

  def new_page_no
    rrrs = current(Office::RepairRecordRegister)
    new_rrr_no = 1
    if rrrs.count > 0
      new_rrr_no = rrrs.last.page_no + 1
    end
    new_rrr_no
  end
end
