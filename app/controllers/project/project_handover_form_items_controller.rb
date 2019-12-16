class ProjectHandoverFormItemsController < ApplicationController
  before_action :set_handover_form_item, only: [:show, :edit, :update, :destroy]

  # GET /handover_form_items
  # GET /handover_form_items.json
  def index
    @handover_form_items = ProjectHandoverFormItem.all
  end

  # GET /handover_form_items/1
  # GET /handover_form_items/1.json
  def show
  end

  # GET /handover_form_items/new
  def new
    @handover_form_item = ProjectHandoverFormItem.new
  end

  # GET /handover_form_items/1/edit
  def edit
  end

  # POST /handover_form_items
  # POST /handover_form_items.json
  def create
    project_item_id = (params[:project_handover_form_item][:project_item_id]).to_d
    handover_form_id =  (params[:project_handover_form_item][:project_handover_form_id]).to_d
    quantity = (params[:project_handover_form_item][:quantity]).to_d
    @incomes = Oneirt.where(project_item_id: project_item_id)
                   .where(transaction_type: 1)
                   .where("sku > 0")
    @incomes.each do |item|
      if item.sku >= quantity
        project_handover_form_item = ProjectHandoverFormItem.new(project_handover_form_item_params)
        project_handover_form_item.quantity = quantity
        project_handover_form_item.amount = quantity * item.rate
        project_handover_form_item = create_project_handover_form_item(project_handover_form_item, item)
        if project_handover_form_item.save
        item.sku = item.sku - quantity
        item.save
        quantity = 0
        break;
        end
      end
 #TODO create a function that handles code and minimize code length in both conditional
      if (item.sku < quantity && item.sku > 0)
        project_handover_form_item = ProjectHandoverFormItem.new(project_handover_form_item_params)
        project_handover_form_item.quantity = item.sku
        project_handover_form_item.handovered_from = item.id
        project_handover_form_item.amount = item.sku * item.rate
        project_handover_form_item = create_project_handover_form_item(project_handover_form_item, item)
       if project_handover_form_item.save
        quantity = quantity - item.sku
        item.sku = 0
        item.save
       end
      end
    end
    @rf = ProjectHandoverForm.find(handover_form_id)
    respond_to do |format|
      format.html { redirect_to @rf, notice: 'Project release item was successfully created.' }
      format.json { render :show, status: :created, location: @project_release_item }
    end
  end

  # PATCH/PUT /handover_form_items/1
  # PATCH/PUT /handover_form_items/1.json
  def update
    respond_to do |format|
      if @handover_form_item.update(handover_form_item_params)
        format.html { redirect_to @handover_form_item.project_handover_form, notice: 'Handover form item was successfully updated.' }
        format.json { render :show, status: :ok, location: @handover_form_item }
      else
        format.html { render :edit }
        format.json { render json: @handover_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handover_form_items/1
  # DELETE /handover_form_items/1.json
  def destroy
    hf = @handover_form_item.project_handover_form
    @handover_form_item.destroy
    respond_to do |format|
      format.html { redirect_to hf, notice: 'Handover form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_handover_form_item
    @handover_form_item = ProjectHandoverFormItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_handover_form_item_params
    params.require(:project_handover_form_item).permit(:project_item_id, :quantity, :physical_status, :project_handover_form_id)
  end

  def create_project_handover_form_item project_handover_form_item, item
    @item = ProjectItem.find(project_handover_form_item.project_item_id)
    project_handover_form_item.item_classification_no = 47
    project_handover_form_item.received_date = item.transaction_date
    project_handover_form_item.country = item.country
    project_handover_form_item.model_no = item.model
    project_handover_form_item.item_identification_no = item.item_identification_no
    project_handover_form_item.age_approx = item.approx_age
    project_handover_form_item.size = item.size
    project_handover_form_item.item_id = @item.item_id
    project_handover_form_item.project_item_id = @item.id
    project_handover_form_item.source = item.source
    project_handover_form_item.user_id = current_user.id
    project_handover_form_item.specification = @item.specification
    project_handover_form_item.project_id =  current_project.id
    project_handover_form_item.office_id = current_office.id
    project_handover_form_item.fiscal_year_id =  current_fiscal_year.id
    project_handover_form_item.handovered_from = item.id
    project_handover_form_item
  end

end
