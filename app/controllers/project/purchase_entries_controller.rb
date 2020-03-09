class Project::PurchaseEntriesController < ApplicationController
  before_action :set_project_entry, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /ProjectPurchaseEntries
  # GET /ProjectPurchaseEntries.json
  def index
    @project_purchase_entries = current(Project::PurchaseEntry)
  end


  # GET /ProjectPurchaseEntries/1
  # GET /ProjectPurchaseEntries/1.json
  def show
    @project_purchase_entry_item = Project::PurchaseEntryItem.new
    @project_purchase_entry_items = @project_purchase_entry.project_purchase_entry_items

  end

  # GET /ProjectPurchaseEntries/new
  def new
    @project_purchase_entry = Project::PurchaseEntry.new
    @project_purchase_entry.entry_no = new_entry_no
  end

  # GET /ProjectPurchaseEntries/1/edit
  def edit
  end

  # POST /ProjectPurchaseEntries
  # POST /ProjectPurchaseEntries.json
  def create
    @project_purchase_entry = Project::PurchaseEntry.new(project_entry_params)
    @project_purchase_entry.fiscal_year_id = current_fiscal_year.id
    @project_purchase_entry.user_id = current_user.id
    @project_purchase_entry.project_id = current_project.id
    @project_purchase_entry.fy = current_fiscal_year.fy
    @project_purchase_entry.entry_no = new_entry_no
    @project_purchase_entry.store_chief_name = current_control_body.store_keeper_name
    @project_purchase_entry.section_chief_name = current_control_body.section_chief_name
    @project_purchase_entry.office_chief_name = current_control_body.project_chief_name
    @project_purchase_entry.store_chief_designation = current_control_body.store_keeper_designation
    @project_purchase_entry.section_chief_designation = current_control_body.section_chief_degination
    @project_purchase_entry.office_chief_designation = current_control_body.project_chief_degination
    @project_purchase_entry.marked_as_final = false
    respond_to do |format|
      if @project_purchase_entry.save
        format.html { redirect_to @project_purchase_entry, notice: 'Project entry was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @project_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ProjectPurchaseEntries/1
  # PATCH/PUT /ProjectPurchaseEntries/1.json
  def update
    respond_to do |format|
      if @project_purchase_entry.update(project_entry_params)
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
    if @project_purchase_entry.purchase_order.blank? == false
      @project_order = @project_purchase_entry.purchase_order
      @project_order.entry_generated = false
      @project_order.save
    end
    @project_purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to @project_order, notice: 'Project entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    if (can_unmark(@project_purchase_entry))
      @project_purchase_entry.marked_as_final = false
      @project_purchase_entry.save
    else
      @project_purchase_entry.marked_as_final = true
      @project_purchase_entry.save
    end
    redirect_to @project_purchase_entry
  end

  private

  def can_unmark obj
    (obj.marked_as_final == true) && (DateTime.now < 3.days.after(obj.updated_at))
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project_entry
    @project_purchase_entry = Project::PurchaseEntry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_entry_params
    params.require(:project_purchase_entry).permit(:purchase_handover_no, :entry_date, :entry_no, :store_chief_signed_date, :section_chief_signed_date, :project_chief_signed_date)
  end

  def new_entry_no
    loe = Project::PurchaseEntry.last
    if (!loe.blank? && loe.entry_no.present?)
      noeen = loe.entry_no + 1
    else
      noeen = 1
    end
    noeen
  end
end
