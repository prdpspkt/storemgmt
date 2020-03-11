class Office::RepairRecordRegisterItemsController < ApplicationController
  before_action :set_repair_record_register_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /repair_record_register_items
  # GET /repair_record_register_items.json
  def index
    @repair_record_register_items = RepairRecordRegisterItem.all
  end

  # GET /repair_record_register_items/1
  # GET /repair_record_register_items/1.json
  def show
  end

  # GET /repair_record_register_items/new
  def new
    @repair_record_register_item = RepairRecordRegisterItem.new
  end

  # GET /repair_record_register_items/1/edit
  def edit
  end

  # POST /repair_record_register_items
  # POST /repair_record_register_items.json
  def create
    @repair_record_register_item = RepairRecordRegisterItem.new(repair_record_register_item_params)

    respond_to do |format|
      if @repair_record_register_item.save
        format.html { redirect_to @repair_record_register_item, notice: 'Repair record register item was successfully created.' }
        format.json { render :show, status: :created, location: @repair_record_register_item }
      else
        format.html { render :new }
        format.json { render json: @repair_record_register_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_record_register_items/1
  # PATCH/PUT /repair_record_register_items/1.json
  def update
    respond_to do |format|
      if @repair_record_register_item.update(repair_record_register_item_params)
        format.html { redirect_to @repair_record_register_item, notice: 'Repair record register item was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_record_register_item }
      else
        format.html { render :edit }
        format.json { render json: @repair_record_register_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_record_register_items/1
  # DELETE /repair_record_register_items/1.json
  def destroy
    @repair_record_register_item.destroy
    respond_to do |format|
      format.html { redirect_to repair_record_register_items_url, notice: 'Repair record register item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_record_register_item
      @repair_record_register_item = RepairRecordRegisterItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_record_register_item_params
      params.require(:repair_record_register_item).permit(:date, :repair_application_no, :applicat_name, :changed_part_name, :changesd_part_cost, :other_expense, :other_expense_cost, :total_expense, :vendor_name, :justified_by, :remarks, :user_id, :office_id, :fy, :fiscal_year_id, :repair_record_register_id)
    end
end
