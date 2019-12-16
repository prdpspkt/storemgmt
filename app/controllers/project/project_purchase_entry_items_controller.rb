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
    @project_purchase_entry_item.user_id = current_user.id
    @project_purchase_entry_item.fy = current_fiscal_year.fy
    @project_purchase_entry_item.fiscal_year_id = current_fiscal_year.id
    @project_purchase_entry_item.project_id = current_project.id
    respond_to do |format|
      if @project_purchase_entry_item.save
        format.html { redirect_to "/project_purchase_entries/#{@project_purchase_entry_item.project_purchase_entry.id}", notice: 'Project purchase entry item was successfully created.' }
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
        @project_purchase_entry_item = prepare_data(@project_purchase_entry_item)
        @project_purchase_entry_item.save
        format.html { redirect_to "/project_purchase_entries/#{@project_purchase_entry_item.project_purchase_entry.id}", notice: 'Project purchase entry item was successfully updated.' }
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
    @id = @project_purchase_entry_item.id
    @project_purchase_entry_item.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_entry_items_url, notice: 'Project purchase entry item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_purchase_entry_item
    @project_purchase_entry_item = ProjectPurchaseEntryItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_purchase_entry_item_params
    params.require(:project_purchase_entry_item).permit(:item_id, :is_vatable, :item_classification_no, :item_registration_page_no, :name_of_item, :specification, :item_identification_no, :model_no, :unit, :quantity, :rate, :amount_without_vat, :vat, :total_amount, :other_expense, :amount, :country, :size, :approx_age, :source, :remarks, :project_purchase_entry_id, :user_id, :project_id, :fy, :fiscal_year)
  end

end
