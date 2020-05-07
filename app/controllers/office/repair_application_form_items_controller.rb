class Office::RepairApplicationFormItemsController < OfficeController
  before_action :set_repair_application_form_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /repair_application_form_items
  # GET /repair_application_form_items.json
  def index
    @repair_application_form_items = RepairApplicationFormItem.all
  end

  # GET /repair_application_form_items/1
  # GET /repair_application_form_items/1.json
  def show
  end

  # GET /repair_application_form_items/new
  def new
    @repair_application_form_item = RepairApplicationFormItem.new
  end

  # GET /repair_application_form_items/1/edit
  def edit
    @personnels = office(Office::Personnel).where(working: true)
    render 'office/repair_application_forms/repaired_record'
  end

  # POST /repair_application_form_items
  # POST /repair_application_form_items.json
  def create
    @repair_application_form_item = Office::RepairApplicationFormItem.new(repair_application_form_item_params)
    @repair_application_form_item = set_current_information @repair_application_form_item
    @repair_application_form_item.item_id = Office::ItemTransaction.find(repair_application_form_item_params[:item_transaction_id]).item_id
    @repair_application_form = Office::RepairApplicationForm.find(@repair_application_form_item.repair_application_form_id)
    @repair_application_form_items = @repair_application_form.repair_application_form_items
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 408).where("sku > 0")
    @personnels = office(Office::Personnel).where(working: true)
    respond_to do |format|
      if @repair_application_form_item.save
        format.html { redirect_to @repair_application_form, notice: 'Repair application form item was successfully created.' }
        format.json { render :show, status: :created, location: @repair_application_form_item }
      else
        format.html { render "office/repair_application_forms/show" }
        format.json { render json: @repair_application_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_application_form_items/1
  # PATCH/PUT /repair_application_form_items/1.json
  def update
    @personnels = office(Office::Personnel).where(working: true)
    respond_to do |format|
      if @repair_application_form_item.update(repair_application_form_item_update_params)
        format.html { redirect_to @repair_application_form_item.repair_application_form, notice: 'Repair application form item was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_application_form_item }
      else
        format.html { render "office/repair_application_forms/repaired_record" }
        format.json { render json: @repair_application_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_application_form_items/1
  # DELETE /repair_application_form_items/1.json
  def destroy
    @raf = @repair_application_form_item.repair_application_form
    @repair_application_form_item.destroy
    respond_to do |format|
      format.html { redirect_to @raf, notice: 'Repair application form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_application_form_item
      @repair_application_form_item = Office::RepairApplicationFormItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_application_form_item_params
      params.require(:office_repair_application_form_item).permit(:personnel_id, :approx_repair_cost, :applicant_sign, :reason_to_repair, :remarks, :item_transaction_id, :repair_application_form_id)
    end

  def repair_application_form_item_update_params
    params.require(:office_repair_application_form_item).permit(:repaired_date, :changed_part_name, :changed_part_cost, :other_expense, :other_expense_cost, :justified_by)
  end
end
