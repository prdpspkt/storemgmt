class ProjectPurchaseEntriesController < ApplicationController
  before_action :set_project_purchase_entry, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /project_purchase_entries
  # GET /project_purchase_entries.json
  def index
    @project_purchase_entries = ProjectPurchaseEntry.all
  end

  # GET /project_purchase_entries/1
  # GET /project_purchase_entries/1.json
  def show
    @project_purchase_entry_item = ProjectPurchaseEntryItem.new
    @project_purchase_entry_item.project_purchase_entry_id = @project_purchase_entry.id
  end

  # GET /project_purchase_entries/new
  def new
    @project_purchase_entry = ProjectPurchaseEntry.new
  end

  # GET /project_purchase_entries/1/edit
  def edit
  end

  # POST /project_purchase_entries
  # POST /project_purchase_entries.json
  def create
    @project_purchase_entry = ProjectPurchaseEntry.new(project_purchase_entry_params)

    respond_to do |format|
      if @project_purchase_entry.save
        format.html { redirect_to @project_purchase_entry, notice: 'Project purchase entry was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_entry }
      else
        format.html { render :new }
        format.json { render json: @project_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_purchase_entries/1
  # PATCH/PUT /project_purchase_entries/1.json
  def update
    respond_to do |format|
      if @project_purchase_entry.update(project_purchase_entry_params)
        format.html { redirect_to @project_purchase_entry, notice: 'Project purchase entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_entry }
      else
        format.html { render :edit }
        format.json { render json: @project_purchase_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_purchase_entries/1
  # DELETE /project_purchase_entries/1.json
  def destroy
    @project_purchase_entry.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_entries_url, notice: 'Project purchase entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_as_final
    redirect_to @project_purchase_entry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_purchase_entry
      @project_purchase_entry = ProjectPurchaseEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_purchase_entry_params
      params.require(:project_purchase_entry).permit(:entry_date, :bill_no, :entry_no, :store_chief_name, :store_chief_designation, :store_chief_signed_date, :section_chief_name, :section_chief_designation, :section_chief_signed_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :user_id, :office_id, :fiscal_year_id, :item_id, :item_register_page_no, :purchase_handover_no, :fy, :marked_as_final)
    end
end
