class OfficeHandoverFormItemsController < ApplicationController
  before_action :set_handover_form_item, only: [:show, :edit, :update, :destroy]

  # GET /office_handover_form_items
  # GET /office_handover_form_items.json
  def index
    @handover_form_items = OfficeHandoverFormItem.all
  end

  # GET /office_handover_form_items/1
  # GET /office_handover_form_items/1.json
  def show
  end

  # GET /office_handover_form_items/new
  def new
    @handover_form_item = OfficeHandoverFormItem.new
  end

  # GET /office_handover_form_items/1/edit
  def edit
  end

  # POST /office_handover_form_items
  # POST /office_handover_form_items.json
  def create
    office_item_id = (params[:office_handover_form_item][:office_item_id]).to_d
    handover_form_id =  (params[:office_handover_form_item][:office_handover_form_id]).to_d
    quantity = (params[:office_handover_form_item][:quantity]).to_d
    @incomes = Oneirt.where(office_item_id: office_item_id)
                   .where(transaction_type: 1)
                   .where("sku > 0")
    @incomes.each do |item|
      if item.sku >= quantity
        office_handover_form_item = OfficeHandoverFormItem.new(office_handover_form_item_params)
        office_handover_form_item.quantity = quantity
        office_handover_form_item.amount = quantity * item.rate
        office_handover_form_item = create_office_handover_form_item(office_handover_form_item, item)
        if office_handover_form_item.save
        item.sku = item.sku - quantity
        item.save
        quantity = 0
        break;
        end
      end
 #TODO create a function that handles code and minimize code length in both conditional
      if (item.sku < quantity && item.sku > 0)
        office_handover_form_item = OfficeHandoverFormItem.new(office_handover_form_item_params)
        office_handover_form_item.quantity = item.sku
        office_handover_form_item.handovered_from = item.id
        office_handover_form_item.amount = item.sku * item.rate
        office_handover_form_item = create_office_handover_form_item(office_handover_form_item, item)
       if office_handover_form_item.save
        quantity = quantity - item.sku
        item.sku = 0
        item.save
       end
      end
    end
    @rf = OfficeHandoverForm.find(handover_form_id)
    respond_to do |format|
      format.html { redirect_to @rf, notice: 'Office release item was successfully created.' }
      format.json { render :show, status: :created, location: @office_release_item }
    end
  end

  # PATCH/PUT /office_handover_form_items/1
  # PATCH/PUT /office_handover_form_items/1.json
  def update
    respond_to do |format|
      if @handover_form_item.update(handover_form_item_params)
        format.html { redirect_to @handover_form_item.office_handover_form, notice: 'Handover form item was successfully updated.' }
        format.json { render :show, status: :ok, location: @handover_form_item }
      else
        format.html { render :edit }
        format.json { render json: @handover_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_handover_form_items/1
  # DELETE /office_handover_form_items/1.json
  def destroy
    hf = @handover_form_item.office_handover_form
    @handover_form_item.destroy
    respond_to do |format|
      format.html { redirect_to hf, notice: 'Handover form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_handover_form_item
    @handover_form_item = OfficeHandoverFormItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_handover_form_item_params
    params.require(:office_handover_form_item).permit(:office_item_id, :quantity, :physical_status, :office_handover_form_id)
  end

  def create_office_handover_form_item office_handover_form_item, item
    @item = OfficeItem.find(office_handover_form_item.office_item_id)
    office_handover_form_item.item_classification_no = 47
    office_handover_form_item.received_date = item.transaction_date
    office_handover_form_item.country = item.country
    office_handover_form_item.model_no = item.model
    office_handover_form_item.item_identification_no = item.item_identification_no
    office_handover_form_item.age_approx = item.approx_age
    office_handover_form_item.size = item.size
    office_handover_form_item.item_id = @item.item_id
    office_handover_form_item.office_item_id = @item.id
    office_handover_form_item.source = item.source
    office_handover_form_item.user_id = current_user.id
    office_handover_form_item.specification = @item.specification
    office_handover_form_item.office_id =  current_office.id
    office_handover_form_item.fiscal_year_id =  current_fiscal_year.id
    office_handover_form_item.handovered_from = item.id
    office_handover_form_item
  end

end
