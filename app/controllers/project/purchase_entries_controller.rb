class Project::PurchaseEntriesController < ProjectController
  before_action :set_office_entry, only: [:show, :edit, :update, :destroy, :mark_as_final, :generate_ledger_entry]
  load_and_authorize_resource except: [:create, :new]
  # GET /ProjectPurchaseEntries
  # GET /ProjectPurchaseEntries.json
  def index
    @purchase_entries = current(Project::PurchaseEntry)
  end


  # GET /ProjectPurchaseEntries/1
  # GET /ProjectPurchaseEntries/1.json
  def show
    @purchase_entry_item = Project::PurchaseEntryItem.new
    @purchase_entry_items = @purchase_entry.purchase_entry_items

  end

  # GET /ProjectPurchaseEntries/new
  def new
    @purchase_entry = Project::PurchaseEntry.new
    @purchase_entry.entry_no = new_entry_no
  end

  # GET /ProjectPurchaseEntries/1/edit
  def edit
  end

  # POST /ProjectPurchaseEntries
  # POST /ProjectPurchaseEntries.json
  def create
    @purchase_entry = Project::PurchaseEntry.new(office_entry_params)
    @purchase_entry.fiscal_year_id = current_fiscal_year.id
    @purchase_entry.user_id = current_user.id
    @purchase_entry.office_id = current_office.id
    @purchase_entry.fy = current_fiscal_year.fy
    @purchase_entry.entry_no = new_entry_no
    @purchase_entry.store_body_id = current_control_body.id
    @purchase_entry.marked_as_final = false
    respond_to do |format|
      if @purchase_entry.save
        format.html { redirect_to @purchase_entry, notice: 'Project entry was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ProjectPurchaseEntries/1
  # PATCH/PUT /ProjectPurchaseEntries/1.json
  def update
    respond_to do |format|
      if @purchase_entry.update(office_entry_params)
        format.html { redirect_to @purchase_entry, notice: 'Project entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_entry }
      else
        format.html { render :edit }
        format.json { render json: @purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ProjectPurchaseEntries/1
  # DELETE /ProjectPurchaseEntries/1.json
  def destroy
    if @purchase_entry.purchase_order.blank? == false
      @purchase_order = @purchase_entry.purchase_order
      @purchase_order.entry_generated = false
      @purchase_order.save
    end
    @purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_entries_path, notice: 'Project entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if @purchase_entry.marked_as_final == true
      @purchase_entry.marked_as_final = false
    else
      @purchase_entry.marked_as_final = true
    end
    @purchase_entry.save
    redirect_to @purchase_entry
  end

  def generate_ledger_entry
    @purchase_entry.ledger_entry_generated = true
    create_item_transaction @purchase_entry
    @purchase_entry.save
    redirect_to @purchase_entry
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_entry
    @purchase_entry = Project::PurchaseEntry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_entry_params
    params.require(:project_purchase_entry).permit(:purchase_handover_no, :entry_date, :entry_no, :store_chief_signed_date, :section_chief_signed_date, :office_chief_signed_date)
  end

  def new_entry_no
    ope = current(Project::PurchaseEntry)
    nopen = 1
    if ope.count > 0
      nopen = ope.last.entry_no + 1
    end
    nopen
  end

  def create_item_transaction purchase_entry
    purchase_entry.purchase_entry_items.each do |entry_item|
      transaction = Project::ItemTransaction.new(entry_item.attributes.select { |key, _| Project::ItemTransaction.column_names.include? key })
      transaction.id = nil
      transaction.item_classification_no = entry_item.item.item_classification_no
      transaction.rate = entry_item.rate * 1.13
      transaction.purchase_entry_item_id = entry_item.id
      transaction.transaction_type = 1
      transaction.entry_no = purchase_entry.entry_no
      transaction.sku = transaction.quantity
      transaction.transaction_date = bs_today
      transaction = set_current_information transaction
      transaction.save
    end
  end

end
