class OfficeOfficeHandoverFormItemsController < ApplicationController
  before_action :set_handover_form_item, only: [:show, :edit, :update, :destroy]

  # GET /handover_form_items
  # GET /handover_form_items.json
  def index
    @handover_form_items = OfficeHandoverFormItem.all
  end

  # GET /handover_form_items/1
  # GET /handover_form_items/1.json
  def show
  end

  # GET /handover_form_items/new
  def new
    @handover_form_item = OfficeHandoverFormItem.new
  end

  # GET /handover_form_items/1/edit
  def edit
  end

  # POST /handover_form_items
  # POST /handover_form_items.json
  def create
    @handover_form_item = OfficeHandoverFormItem.new(handover_form_item_params)
    @handover_form_item.user_id = current_user.id
    @handover_form_item.fiscal_year_id = current_fiscal_year.id
    @handover_form_item.office_id = current_office.id
    respond_to do |format|
      if @handover_form_item.save
        format.html { redirect_to @handover_form_item.office_handover_form, notice: 'Handover form item was successfully created.' }
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
        format.html { redirect_to @handover_form_item.office_handover_form, notice: 'Handover form item was successfully updated.' }
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
      format.html { redirect_to office_handover_forms_url, notice: 'Handover form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_handover_form_item
      @handover_form_item = OfficeHandoverFormItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def handover_form_item_params
      params.require(:office_handover_form_item).permit( :office_item_id, :quantity, :physical_status, :office_handover_form_id)
    end

end
