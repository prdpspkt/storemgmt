class Project::PurchaseEntryItemsController < ProjectController
  before_action :set_project_purchase_entry_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]

  # GET /project_purchase_entry_items/1/edit
  def edit
  end

  # POST /project_purchase_entry_items
  # POST /project_purchase_entry_items.json
  def create
    @purchase_entry_item = Project::PurchaseEntryItem.new(project_purchase_entry_item_params)
    @purchase_entry_item = set_current_information @purchase_entry_item
    @purchase_entry_item.sku = @purchase_entry_item.quantity
    prepare_data
    respond_to do |format|
      if @purchase_entry_item.save
        format.html { redirect_to @purchase_entry_item.purchase_entry, notice: 'Project purchase entry item was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_entry_item }
      else
        format.html { redirect_to project_purchase_entry_path(Project::PurchaseEntry.find(@purchase_entry_item.purchase_entry_id))}
        format.json { render json: @purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_purchase_entry_items/1
  # PATCH/PUT /project_purchase_entry_items/1.json
  def update
    respond_to do |format|
      if @purchase_entry_item.update(project_purchase_entry_item_params)
        @purchase_entry_item.save
        format.html { redirect_to @purchase_entry_item.purchase_entry, notice: 'Project purchase entry item was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_entry_item }
      else
        format.html { render :edit }
        format.json { render json: @purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_purchase_entry_items/1
  # DELETE /project_purchase_entry_items/1.json
  def destroy
    @purchase_entry = @purchase_entry_item.purchase_entry
    @purchase_entry_item.destroy
    respond_to do |format|
      format.html { redirect_to @purchase_entry, notice: 'Project purchase entry item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_purchase_entry_item
    @purchase_entry_item = Project::PurchaseEntryItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_purchase_entry_item_params
    params.require(:project_purchase_entry_item).permit(:item_id, :is_vatable, :item_classification_no, :item_registration_page_no, :name_of_item, :specification, :item_identification_no, :model_no, :unit, :quantity, :rate, :amount_without_vat, :vat, :total_amount, :other_expense, :amount, :country, :size, :approx_age, :source, :remarks, :purchase_entry_id, :user_id, :project_id, :fy, :fiscal_year)
  end
end
