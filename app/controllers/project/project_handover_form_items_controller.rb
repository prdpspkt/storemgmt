class ProjectHandoverFormItemsController < ApplicationController
  before_action :set_project_handover_form_item, only: [:show, :edit, :update, :destroy]

  # GET /project_handover_form_items
  # GET /project_handover_form_items.json
  def index
    @project_handover_form_items = ProjectHandoverFormItem.all
  end

  # GET /project_handover_form_items/1
  # GET /project_handover_form_items/1.json
  def show
  end

  # GET /project_handover_form_items/new
  def new
    @project_handover_form_item = ProjectHandoverFormItem.new
  end

  # GET /project_handover_form_items/1/edit
  def edit
  end

  # POST /project_handover_form_items
  # POST /project_handover_form_items.json
  def create
    @project_handover_form_item = ProjectHandoverFormItem.new(project_handover_form_item_params)

    respond_to do |format|
      if @project_handover_form_item.save
        format.html { redirect_to @project_handover_form_item, notice: 'Project handover form item was successfully created.' }
        format.json { render :show, status: :created, location: @project_handover_form_item }
      else
        format.html { render :new }
        format.json { render json: @project_handover_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_handover_form_items/1
  # PATCH/PUT /project_handover_form_items/1.json
  def update
    respond_to do |format|
      if @project_handover_form_item.update(project_handover_form_item_params)
        format.html { redirect_to @project_handover_form_item, notice: 'Project handover form item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_handover_form_item }
      else
        format.html { render :edit }
        format.json { render json: @project_handover_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_handover_form_items/1
  # DELETE /project_handover_form_items/1.json
  def destroy
    @project_handover_form_item.destroy
    respond_to do |format|
      format.html { redirect_to project_handover_form_items_url, notice: 'Project handover form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_handover_form_item
      @project_handover_form_item = ProjectHandoverFormItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_handover_form_item_params
      params.require(:project_handover_form_item).permit(:item_classification_no, :item_register_page_no, :name_of_item_ne, :name_of_item_en, :specification, :item_identification_no, :model_no, :unit_ne, :unit_en, :quantity, :amount, :received_date, :physical_status, :fy, :fiscal_year_id, :user_id, :office_id, :project_id, :handover_form_id, :item_id, :project_item_id, :project_handover_form_id, :country, :size, :approx_age, :source)
    end
end
