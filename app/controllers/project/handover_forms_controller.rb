class Project::HandoverFormsController < ProjectController
  before_action :set_handover_form, only: [:show, :edit, :update, :destroy, :mark_as_final, :generate_ledger_entry]
  load_and_authorize_resource except: [:create, :new]
  # GET /handover_forms
  # GET /handover_forms.json
  def index
    @handover_forms = current(Office::HandoverForm)
  end

  # GET /handover_forms/1
  # GET /handover_forms/1.json
  def show
    @handover_form_item = Office::HandoverFormItem.new
    @handover_form_items = @handover_form.handover_form_items
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 47).where("sku > 0")
  end

  # GET /handover_forms/new
  def new
    @handover_form = Office::HandoverForm.new
    @handover_form.form_no = new_office_handover_no
  end

  # GET /handover_forms/1/edit
  def edit
  end

  # POST /handover_forms
  # POST /handover_forms.json
  def create
    @handover_form = Office::HandoverForm.new(handover_form_params)
    @handover_form = set_current_information @handover_form
    @handover_form.marked_as_final = false
    @handover_form.entry_generated = false
    @handover_form.store_body_id = 1
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

  def mark_as_final
   if(@handover_form.marked_as_final == false)
      @handover_form.marked_as_final = true
   else
      @handover_form.marked_as_final = false
    end
    @handover_form.save
    redirect_to(office_handover_form_path(@handover_form))
  end

  def generate_ledger_entry
    items = @handover_form.handover_form_items
    items.each do |item|
      item_transaction = Office::ItemTransaction.new(item.attributes.select{|key, value| Office::ItemTransaction.column_names.include? key})
      item_transaction.id = nil
      item_transaction.entry_no = @handover_form.form_no
      item_transaction.handover_form_item_id = item.id
      item_transaction.transaction_type = -1
      item_transaction.transaction_date = @handover_form.date
      item_transaction.remarks = @handover_form.handovered_office_name
      item_transaction.save
    end
    @handover_form.entry_generated = true
    @handover_form.save
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
      @handover_form = Office::HandoverForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handover_form_params
      params.require(:office_handover_form).permit(:decision_date, :decision_no, :handovered_office_name, :date, :form_no, :store_keeper_signed_date, :office_chief_signed_date)
    end

  def new_office_handover_no
    handover_forms = current(Office::HandoverForm)
    nhn = 1
    if handover_forms.count > 0
      nhn = handover_forms.last.form_no + 1
    end
    nhn
  end

end
