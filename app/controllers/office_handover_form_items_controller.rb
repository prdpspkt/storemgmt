class OfficeHandoverFormItemsController < ApplicationController
  before_action :set_handover_form_item, only: [:show, :edit, :update, :destroy]

  # GET /handover_form_items
  # GET /handover_form_items.json
  def index
    @handover_form_items = HandoverFormItem.all
  end

  # GET /handover_form_items/1
  # GET /handover_form_items/1.json
  def show
  end

  # GET /handover_form_items/new
  def new
    @handover_form_item = HandoverFormItem.new
  end

  # GET /handover_form_items/1/edit
  def edit
  end

  # POST /handover_form_items
  # POST /handover_form_items.json
  def create
    @handover_form_item = HandoverFormItem.new(handover_form_item_params)

    respond_to do |format|
      if @handover_form_item.save
        format.html { redirect_to @handover_form_item, notice: 'Handover form item was successfully created.' }
        format.json { render :show, status: :created, location: @handover_form_item }
      else
        format.html { render :new }
        format.json { render json: @handover_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /handover_form_items/1
  # PATCH/PUT /handover_form_items/1.json
  def update
    respond_to do |format|
      if @handover_form_item.update(handover_form_item_params)
        format.html { redirect_to @handover_form_item, notice: 'Handover form item was successfully updated.' }
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
    @handover_form_item.destroy
    respond_to do |format|
      format.html { redirect_to handover_form_items_url, notice: 'Handover form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handover_form_item
      @handover_form_item = HandoverFormItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handover_form_item_params
      params.require(:handover_form_item).permit(:item_classification_no, :item_register_page_no, :name_of_item, :specification, :item_identification_no, :model_no, :unit, :quantity, :amount, :received_date, :physical_status, :fy, :fiscal_year_id, :user_id, :office_id, :project_id, :handover_form_id)
    end
end
