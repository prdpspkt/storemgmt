class ProjectTenderBreakdownItemsController < ApplicationController
  before_action :set_project_tender_breakdown_item, only: [:show, :edit, :update, :destroy]

  # GET /project_tender_breakdown_items
  # GET /project_tender_breakdown_items.json
  def index
    ptbis = ProjectTenderBreakdownItem.all
  end

  # GET /project_tender_breakdown_items/1
  # GET /project_tender_breakdown_items/1.json
  def show
  end

  # GET /project_tender_breakdown_items/new
  def new
    ptbi = ProjectTenderBreakdownItem.new
  end

  # GET /project_tender_breakdown_items/1/edit
  def edit
  end

  # POST /project_tender_breakdown_items
  # POST /project_tender_breakdown_items.json
  def create
    @project_tender_breakdown_item = ProjectTenderBreakdownItem.new(project_tender_breakdown_item_params)
    @item = ProjectPurchaseEntryItem.find(@project_tender_breakdown_item.project_purchase_entry_item_id)
    irpn = create_project_item_if_doesnt_exists @item.item_id, @project_tender_breakdown_item.project_tender_breakdown.project_id
    ptbi = ProjectTenderBreakdownItem.new(@item.attributes.select { |key, _| ProjectTenderBreakdownItem.attribute_names.include? key })
    ptbi.project_purchase_entry_item_id = @project_tender_breakdown_item.project_purchase_entry_item_id
    ptbi.id = nil
    ptbi.project_tender_breakdown_id = @project_tender_breakdown_item.project_tender_breakdown_id
    ptbi.item_register_page_no = irpn.item_register_page_no
    ptbi.project_item_id = irpn.id
    ptbi.rate = @item.rate
    ptbi.item_id = @item.item_id
    if @project_tender_breakdown_item.quantity > @item.sku
      ptbi.amount = @item.rate * @item.sku
      ptbi.quantity = @item.sku
      @item.sku = 0
    else
      ptbi.quantity = @project_tender_breakdown_item.quantity
      ptbi.amount = @item.rate * ptbi.quantity
      @item.sku = @item.sku - ptbi.quantity
    end
    ptbi.name_of_item_ne = @item.name_of_item_ne
    ptbi.unit_ne = @item.unit_ne
    ptbi.unit_en = @item.unit_en
    respond_to do |format|
        if ptbi.save
        @item.save
        format.html { redirect_to project_tender_breakdown_path(ptbi.project_tender_breakdown), notice: 'Project tender breakdown item was successfully created.' }
        format.json { render :show, status: :created, location: ptbi }
      else
        format.html { project_tender_breakdown_path(ptbi.project_tender_breakdown) }
        format.json { render json: ptbi.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /project_tender_breakdown_items/1
  # DELETE /project_tender_breakdown_items/1.json
  def destroy
    project_purchase_entry_item_id = ptbi.project_purchase_entry_item_id
    project_purchase_entry_item = ProjectPurchaseEntryItem.find(project_purchase_entry_item_id)
    project_tender_breakdown = ptbi.project_tender_breakdown
    project_purchase_entry_item.sku = project_purchase_entry_item.sku + ptbi.quantity
    respond_to do |format|
      if ptbi.destroy
        project_purchase_entry_item.save
        format.html { redirect_to project_tender_breakdown_path(project_tender_breakdown), notice: 'Project tender breakdown item was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to project_tender_breakdown_path(project_tender_breakdown), notice: 'Project tender breakdown item cannot des+troyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_tender_breakdown_item
    ptbi = ProjectTenderBreakdownItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_tender_breakdown_item_params
    params.require(:project_tender_breakdown_item).permit(:quantity, :project_tender_breakdown_id, :project_purchase_entry_item_id, :project_id)
  end

  def create_project_item_if_doesnt_exists item_id, project_id
    @irpn = false
    item = Item.find(item_id)
    @pi = ProjectItem.where(project_id: project_id).where(item_id: item_id).where(fiscal_year_id: current_fiscal_year.id).first
    if @pi.blank?
      @project_item = ProjectItem.new
      @project_item.item_register_page_no = generate_item_register_no project_id
      @project_item.name_of_item_ne = item.name_of_item_ne
      @project_item.name_of_item_en = item.name_of_item_en
      @project_item.unit_ne = item.unit_ne
      @project_item.item_id = item.id
      @project_item.unit_en = item.unit_en
      @project_item.model_no = item.model_no
      @project_item.item_identification_no = item.item_identification_no
      @project_item.office_id = current_office.id
      @project_item.fiscal_year_id = current_fiscal_year.id
      @project_item.project_id = project_id
      @project_item.save
      @irpn = @project_item
    else
      @irpn = @pi
    end
    @irpn
  end
  def generate_item_register_no project_id
    item_register_no = 1
    items = ProjectItem.where(project_id: project_id).where(fiscal_year_id: current_fiscal_year.id).where(project_id: nil)
    if items.count > 0
      item_register_no = items.last.item_register_no + 1
    end
    item_register_no
  end
end