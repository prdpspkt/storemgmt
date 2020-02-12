class ProjectPurchaseEntryItemsController < ApplicationController
  before_action :set_project_purchase_entry_item, only: [:show, :edit, :update, :destroy]

  # GET /project_purchase_entry_items
  # GET /project_purchase_entry_items.json
  def index
    @project_purchase_entry_items = ProjectPurchaseEntryItem.all
  end

  # GET /project_purchase_entry_items/1
  # GET /project_purchase_entry_items/1.json
  def show
  end

  # GET /project_purchase_entry_items/new
  def new
    @project_purchase_entry_item = ProjectPurchaseEntryItem.new
  end

  # GET /project_purchase_entry_items/1/edit
  def edit
  end

  # POST /project_purchase_entry_items
  # POST /project_purchase_entry_items.json
  def create
    @project_purchase_entry_item = ProjectPurchaseEntryItem.new(project_purchase_entry_item_params)
    create_project_item_if_doesnt_exists @project_purchase_entry_item.item_id
    @project_purchase_entry_item.sku = @project_purchase_entry_item.quantity
    respond_to do |format|
      if @project_purchase_entry_item.save
        format.html { redirect_to @project_purchase_entry_item, notice: 'Project purchase entry item was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_entry_item }
      else
        format.html { render :new }
        format.json { render json: @project_purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_purchase_entry_items/1
  # PATCH/PUT /project_purchase_entry_items/1.json
  def update
    respond_to do |format|
      if @project_purchase_entry_item.update(project_purchase_entry_item_params)
        format.html { redirect_to @project_purchase_entry_item.project_purchase_entry, notice: 'Project purchase entry item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_entry_item }
      else
        format.html { render :edit }
        format.json { render json: @project_purchase_entry_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_purchase_entry_items/1
  # DELETE /project_purchase_entry_items/1.json
  def destroy
    respond_to do |format|
      if @project_purchase_entry_item.project_tender_breakdown_item.present?
        @project_purchase_entry_item.destroy
        format.html { redirect_to project_purchase_entry_items_url, notice: 'Project purchase entry item was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to project_purchase_entry_items_url, notice: 'Some of the items in Project Tender Breakdown are associated with this item. Please delete them first.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_purchase_entry_item
    @project_purchase_entry_item = ProjectPurchaseEntryItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_purchase_entry_item_params
    params.require(:project_purchase_entry_item).permit(:item_classification_no, :item_register_page_no, :name_of_item_ne, :name_of_item_en, :specification, :item_identification_no, :model_no, :unit_ne, :unit_en, :quantity, :rate, :amount_without_vat, :vat, :total_amount, :other_expenses, :amount, :remarks, :project_purchase_entry_id, :user_id, :office_id, :fy, :item_id, :fiscal_year_id, :project_item_id, :country, :size, :approx_age, :source, :is_vatable)
  end

  def update_general_information item
    item.office_id = current_office.id
    item.fiscal_year = current_fiscal_year.id
    item.user_id = current_user.id
    item
  end

  def create_project_item_if_doesnt_exists item_id
    @irpn = false
    @item = Item.find(item_id)
    @pi = ProjectItem.where(item_id: item_id).where(fiscal_year_id: current_fiscal_year.id).first
    if @pi.blank?
      @project_item = ProjectItem.new
      @project_item.item_register_page_no = generate_item_register_no
      @project_item.name_of_item_ne = @item.name_of_item_ne
      @project_item.name_of_item_en = @item.name_of_item_en
      @project_item.unit_ne = @item.unit_ne
      @project_item.item_id = @item.id
      @project_item.unit_en = @item.unit_en
      @project_item.model_no = @item.model_no
      @project_item.item_identification_no = @item.item_identification_no
      @project_item.office_id = current_office.id
      @project_item.fiscal_year_id = current_fiscal_year.id
      @project_item.save
      @irpn = @project_item.item_register_page_no
    else
      @irpn = @pi.item_register_page_no
    end
    @irpn
  end
  def generate_item_register_no
    item_register_no = 1
    items = ProjectItem.where(fiscal_year_id: current_fiscal_year.id).where(project_id: nil)
    if items.count > 0
      item_register_no = items.last.item_register_no + 1
    end
    item_register_no
  end

end
