class Office::RepairApplicationFormItemsController < ApplicationController
  before_action :set_repair_application_form_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /repair_application_form_items
  # GET /repair_application_form_items.json
  def index
    @repair_application_form_items = RepairApplicationFormItem.all
  end

  # GET /repair_application_form_items/1
  # GET /repair_application_form_items/1.json
  def show
  end

  # GET /repair_application_form_items/new
  def new
    @repair_application_form_item = RepairApplicationFormItem.new
  end

  # GET /repair_application_form_items/1/edit
  def edit
  end

  # POST /repair_application_form_items
  # POST /repair_application_form_items.json
  def create
    @repair_application_form_item = RepairApplicationFormItem.new(repair_application_form_item_params)

    respond_to do |format|
      if @repair_application_form_item.save
        format.html { redirect_to @repair_application_form_item, notice: 'Repair application form item was successfully created.' }
        format.json { render :show, status: :created, location: @repair_application_form_item }
      else
        format.html { render :new }
        format.json { render json: @repair_application_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_application_form_items/1
  # PATCH/PUT /repair_application_form_items/1.json
  def update
    respond_to do |format|
      if @repair_application_form_item.update(repair_application_form_item_params)
        format.html { redirect_to @repair_application_form_item, notice: 'Repair application form item was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_application_form_item }
      else
        format.html { render :edit }
        format.json { render json: @repair_application_form_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_application_form_items/1
  # DELETE /repair_application_form_items/1.json
  def destroy
    @repair_application_form_item.destroy
    respond_to do |format|
      format.html { redirect_to repair_application_form_items_url, notice: 'Repair application form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_application_form_item
      @repair_application_form_item = RepairApplicationFormItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_application_form_item_params
      params.require(:repair_application_form_item).permit(:name_of_item, :item_identification_no, :approx_repair_cost, :reason_toPrepair, :applicant_sign, :remarks, :user_id, :office_id, :repair_application_form_id)
    end
end
