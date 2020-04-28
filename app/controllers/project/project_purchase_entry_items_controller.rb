class Project::ProjectPurchaseEntryItemsController < ProjectController
  before_action :set_project_purchase_entry_item, only: [:show, :edit, :update, :destroy]

  # GET /project_purchase_entry_items
  # GET /project_purchase_entry_items.json
  def index
    @project_purchase_entry_items = Project::ProjectPurchaseEntryItem.all
  end

  # GET /project_purchase_entry_items/1
  # GET /project_purchase_entry_items/1.json
  def show
  end

  # GET /project_purchase_entry_items/new
  def new
    @project_purchase_entry_item = Project::ProjectPurchaseEntryItem.new
  end

  # GET /project_purchase_entry_items/1/edit
  def edit
  end

  # POST /project_purchase_entry_items
  # POST /project_purchase_entry_items.json
  def create
    @project_purchase_entry_item = Project::ProjectPurchaseEntryItem.new(project_purchase_entry_item_params)
    @item_transactions = Project::ItemTransaction.where(item_id: @project_purchase_entry_item.item_id).where("sku > 0")
    @item_transactions.each do |tr|
      ppei = Project::ProjectPurchaseEntryItem.new(tr.attributes.select { |key, _| Project::ProjectPurchaseEntryItem.column_names.include? key })
      ppei.id = nil
      ppei.item_transaction_id = tr.id
      rate = (tr.rate * (100.00 / 113.00)).round(2)
      if tr.sku > @project_purchase_entry_item.quantity.to_d
        quantity = @project_purchase_entry_item.quantity.to_d
        amount_without_vat = rate * quantity
        amount = amount_without_vat * 1.13
        total_amount = amount
        ppei.quantity = quantity
        ppei.rate = rate
        ppei.amount_without_vat = amount_without_vat
        ppei.amount = amount
        ppei.vat = amount - amount_without_vat
        ppei.total_amount = total_amount
        ppei.project_item_id = create_project_item(@project_purchase_entry_item.project_id, @project_purchase_entry_item.item_id).id
        ppei = set_current_information ppei
        ppei.project_id = @project_purchase_entry_item.project_id
        ppei.project_purchase_entry_id = @project_purchase_entry_item.project_purchase_entry_id
        if ppei.save!
          tr.sku = tr.sku - ppei.quantity
          tr.save
        end
        break
      else
        quantity = tr.sku
        amount_without_vat = rate * quantity
        amount = amount_without_vat * 1.13
        total_amount = amount
        ppei.quantity = quantity
        ppei.rate = rate
        ppei.amount_without_vat = amount_without_vat
        ppei.amount = amount
        ppei.vat = amount - amount_without_vat
        ppei.total_amount = total_amount
        ppei.project_id = @project_purchase_entry_item.project_id
        ppei.project_item_id = create_project_item(@project_purchase_entry_item.project_id, @project_purchase_entry_item.item_id).id
        ppei = set_current_information ppei
        ppei.project_purchase_entry_id = @project_purchase_entry_item.project_purchase_entry_id
        if ppei.save!
          tr.sku = 0
          tr.save
        end
      end
    end
    @project_purchase_entry = Project::ProjectPurchaseEntry.find(@project_purchase_entry_item.project_purchase_entry_id)
    redirect_to @project_purchase_entry
  end

  # PATCH/PUT /project_purchase_entry_items/1
  # PATCH/PUT /project_purchase_entry_items/1.json
  def update
    respond_to do |format|
      if @project_purchase_entry_item.update(project_purchase_entry_item_params)
        format.html { redirect_to @project_purchase_entry_item.project_purchase_entry, notice: 'Project purchase entry item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_entry_item }
      else
        format.html { redirect_to @project_purchase_entry_item.project_purchase_entry }
        format.json { render json: @project_purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_purchase_entry_items/1
  # DELETE /project_purchase_entry_items/1.json
  def destroy
    project_purchase_entry = @project_purchase_entry_item.project_purchase_entry
    @project_purchase_entry_item.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_entry, notice: 'Project purchase entry item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_purchase_entry_item
    @project_purchase_entry_item = Project::ProjectPurchaseEntryItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_purchase_entry_item_params
    params.require(:project_project_purchase_entry_item).permit(:project_purchase_entry_id, :item_id, :project_id, :quantity, :remarks)
  end

  def create_project_item project_id, item_id
    if project_item_exists(project_id, item_id) != false
      project_item = Project::ProjectItem.where(project_id: project_id).where(item_id: item_id).first
    else
      item = Project::Item.find(item_id)
      project_item = Project::ProjectItem.new(item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
      project_item.id = nil
      project_item.project_id = project_id
      project_item.item_id = item_id
      project_item = set_current_information project_item
      project_item.item_category_id = item.item_category_id
      project_item.item_register_page_no = new_project_item_register_page_no project_id
      project_item.save
    end
    project_item
  end

  def new_project_item_register_page_no project_id
    project_items = office(Project::ProjectItem).where(project_id: project_id)
    pirpn = 1
    if project_items.count > 0
      pirpn = project_items.last.item_register_page_no + 1
    end
    pirpn
  end

  def project_item_exists project_id, item_id
    project_item = false
    project_items = office(Project::ProjectItem).where(project_id: project_id).where(item_id: item_id)
    if project_items.count > 0
      project_item = project_items.first
    end
    project_item
  end

  def create_entries

  end
end
