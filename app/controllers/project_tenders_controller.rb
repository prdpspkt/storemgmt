class ProjectTendersController < ApplicationController
  before_action :set_project_tender, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /project_tenders
  # GET /project_tenders.json
  def index
    @project_tenders = current(ProjectTender)
  end

  # GET /project_tenders/1
  # GET /project_tenders/1.json
  def show
    @project_tender_item = ProjectTenderItem.new
    @project_tender_items = @project_tender.project_tender_items
  end

  # GET /project_tenders/new
  def new
    @project_tender = ProjectTender.new
  end

  # GET /project_tenders/1/edit
  def edit
  end

  # POST /project_tenders
  # POST /project_tenders.json
  def create
    @project_tender = ProjectTender.new(project_tender_params)
    @project_tender = update_general_information @project_tender
    respond_to do |format|
      if @project_tender.save
        format.html { redirect_to @project_tender, notice: 'Project purchase tender was successfully created.' }
        format.json { render :show, status: :created, location: @project_tender }
      else
        format.html { render :new }
        format.json { render json: @project_tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tenders/1
  # PATCH/PUT /project_tenders/1.json
  def update
    respond_to do |format|
      if @project_tender.update(project_tender_params)
        format.html { redirect_to @project_tender, notice: 'Project purchase tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_tender }
      else
        format.html { render :edit }
        format.json { render json: @project_tender.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_final
    if @project_tender.marked_as_final == true
      @project_tender.marked_as_final = false
      if @project_tender.project_purchase_entry.blank? == false
        @project_tender.project_purchase_entry.destroy
      end
    else
      @project_tender.marked_as_final = true
      @project_purchase_entry = ProjectPurchaseEntry.new
      @project_purchase_entry.entry_no = new_purchase_entry_no
      @project_purchase_entry.entry_date = @project_tender.tender_date
      @project_purchase_entry.store_chief_name = @project_tender.store_keeper_name
      @project_purchase_entry.store_chief_designation = @project_tender.store_keeper_designation
      @project_purchase_entry.section_chief_name = @project_tender.section_chief_name
      @project_purchase_entry.section_chief_designation = @project_tender.section_chief_designation
      @project_purchase_entry.office_chief_name = @project_tender.office_chief_name
      @project_purchase_entry.office_chief_designation = @project_tender.office_chief_designation
      @project_purchase_entry.project_tender_id = @project_tender.id
      @project_purchase_entry.office_id = current_office.id
      @project_purchase_entry.user_id = current_user.id
      @project_purchase_entry.fiscal_year_id = current_fiscal_year.id
      @project_purchase_entry.purchase_handover_no = "Tender/#{@project_tender.tender_no}"
      @project_purchase_entry.save!

      @project_tender.project_tender_items.each do |item|
        irpn = create_project_item_if_doesnt_exists item.item_id
        ppei = ProjectPurchaseEntryItem.new(item.attributes.select { |key, _| ProjectPurchaseEntryItem.attribute_names.include? key })
        ppei.id = nil
        ppei.item_register_page_no = irpn
        ppei.project_purchase_entry_id = @project_purchase_entry.id
        ppei.total_amount = ppei.amount
        ppei.save!
      end

    end
    @project_tender.save!
    redirect_to @project_tender
  end

  # DELETE /project_tenders/1
  # DELETE /project_tenders/1.json
  def destroy
    @project_tender.destroy
    respond_to do |format|
      format.html { redirect_to project_tenders_url, notice: 'Project purchase tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_tender
    @project_tender = ProjectTender.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_tender_params
    params.require(:project_tender).permit(:tender_no, :tender_name, :tender_date, :marked_as_final, :bidders_name, :bidders_address)
  end

  def update_general_information object
    object.user_id = current_user.id
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object.store_keeper_name = current_control_body.store_keeper_name
    object.store_keeper_designation = current_control_body.store_keeper_designation
    object.section_chief_name = current_control_body.section_chief_name
    object.section_chief_designation = current_control_body.section_chief_degination
    object.office_chief_name = current_control_body.office_chief_name
    object.office_chief_designation = current_control_body.office_chief_degination
    object
  end

  def new_purchase_entry_no
    pen = 1
    project_purchase_entry = ProjectPurchaseEntry.where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id).last
    if project_purchase_entry.blank? == false
      pen = project_purchase_entry.entry_no + 1
    end
    pen
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
