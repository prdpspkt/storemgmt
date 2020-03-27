class Project::ProjectPurchaseEntriesController < ProjectController
  before_action :set_project_entry, only: [:show, :edit, :update, :destroy, :accept, :transaction]
  before_action :set_office_information, only: :print
  load_and_authorize_resource except: [:create, :new]
  # GET /ProjectPurchaseEntries
  # GET /ProjectPurchaseEntries.json
  def index
    @purchase_entries = current(Project::ProjectPurchaseEntry)
  end


  # GET /ProjectPurchaseEntries/1
  # GET /ProjectPurchaseEntries/1.json
  def show
    @project_purchase_entry_item = Project::ProjectPurchaseEntryItem.new
    @project_purchase_entry_items = @project_purchase_entry.project_purchase_entry_items
    @project_purchase_entry_item.project_id = @project_purchase_entry.project_id
    @project_purchase_entry_item.project_purchase_entry_id = @project_purchase_entry.id
    @items = @project_purchase_entry.purchase_entry.purchase_entry_items
  end

  # GET /ProjectPurchaseEntries/new
  def new
    @project_purchase_entry = Project::ProjectPurchaseEntry.new
    @project_purchase_entry.entry_no = new_entry_no
    new_form_variables
  end

  # GET /ProjectPurchaseEntries/1/edit
  def edit
    new_form_variables
  end

  # POST /ProjectPurchaseEntries
  # POST /ProjectPurchaseEntries.json
  def create
    @project_purchase_entry = Project::ProjectPurchaseEntry.new(project_project_purchase_entry_params)
    @project_purchase_entry = set_current_information @project_purchase_entry
    @project_purchase_entry.store_body_id = current_control_body.id
    @project_purchase_entry.entry_no = new_entry_no
    respond_to do |format|
      if @project_purchase_entry.save
        format.html { redirect_to @project_purchase_entry, notice: 'Project entry was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_entry }
      else
        new_form_variables
        format.html { render :new }
        format.json { render json: @project_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ProjectPurchaseEntries/1
  # PATCH/PUT /ProjectPurchaseEntries/1.json
  def update
    respond_to do |format|
      if @project_purchase_entry.update(project_project_purchase_entry_params)
        format.html { redirect_to @project_purchase_entry, notice: 'Project entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_entry }
      else
        format.html { render :edit }
        format.json { render json: @project_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ProjectPurchaseEntries/1
  # DELETE /ProjectPurchaseEntries/1.json
  def destroy
    @project_purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to project_project_purchase_entries_path, notice: 'Project entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    if @project_purchase_entry.marked_as_final == true
      @project_purchase_entry.marked_as_final = false
    else
      @project_purchase_entry.marked_as_final = true
    end
    @project_purchase_entry.save
    redirect_to @project_purchase_entry
  end

  def transaction
    @project_purchase_entry.ledger_entry_generated = true
    create_item_transaction @project_purchase_entry
    @project_purchase_entry.save
    redirect_to @project_purchase_entry
  end

  def print
    @project_purchase_entry_items = @project_purchase_entry.project_purchase_entry_items
    @total_amount = @project_purchase_entry_items.sum(:total_amount)
    @amount = @project_purchase_entry_items.sum(:amount)
    @amount_without_vat = @project_purchase_entry_items.sum(:amount_without_vat)
    @vat = @project_purchase_entry_items.sum(:vat)
    @other_expense = @project_purchase_entry_items.sum(:other_expense)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_entry
    @project_purchase_entry = Project::ProjectPurchaseEntry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_project_purchase_entry_params
    params.require(:project_project_purchase_entry).permit(:project_id, :purchase_entry_id,  :store_keeper_signed_date, :section_chief_signed_date, :office_chief_signed_date, :entry_date)
  end

  def new_entry_no
    ope = current(Project::ProjectPurchaseEntry).where(project_id: @project_purchase_entry.project_id)
    nopen = 1
    if ope.count > 0
      nopen = ope.last.entry_no + 1
    end
    nopen
  end

  def create_item_transaction project_purchase_entry
    project_purchase_entry.project_purchase_entry_items.each do |entry_item|
      transaction = Project::ItemTransaction.new(entry_item.attributes.select { |key, _| Project::ItemTransaction.column_names.include? key })
      transaction.id = nil
      transaction.item_classification_no = entry_item.item.item_classification_no
      transaction.rate = entry_item.rate * 1.13
      transaction.project_purchase_entry_item_id = entry_item.id
      transaction.transaction_type = 1
      transaction.entry_no = project_purchase_entry.entry_no
      transaction.sku = transaction.quantity
      transaction.transaction_date = bs_today
      transaction = set_current_information transaction
      transaction.save
    end
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end

  def new_form_variables
    @purchase_entries = current(Project::PurchaseEntry)
    @projects = office(Project::Project).where(project_status: 0)
  end

end
