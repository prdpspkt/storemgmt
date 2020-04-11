class Office::RepairRecordRegistersController < ApplicationController
  before_action :set_repair_record_register, only: [:show, :edit, :update, :destroy, :print]
  before_action :set_office_information, only: [:print]
  load_and_authorize_resource except: [:create, :new]
  # GET /repair_record_registers
  # GET /repair_record_registers.json
  def index
    @repair_record_registers = current(Office::RepairRecordRegister)
  end

  # GET /repair_record_registers/1
  # GET /repair_record_registers/1.json
  def show
    @repair_record_register_items = @repair_record_register.repair_record_register_items
    @repair_record_register_item = Office::RepairRecordRegisterItem.new
    @repair_record_register_item.repair_record_register_id = @repair_record_register.id
    @vendors = current(Office::Vendor)
  end

  # GET /repair_record_registers/new
  def new
    @repair_record_register = Office::RepairRecordRegister.new
    @repair_record_register.page_no = new_page_no
  end

  # GET /repair_record_registers/1/edit
  def edit
  end

  # POST /repair_record_registers
  # POST /repair_record_registers.json
  def create
    @repair_record_register = Office::RepairRecordRegister.new(repair_record_register_params)
    @item_transaction = Office::ItemTransaction.find(repair_record_register_params[:item_transaction_id])
    @repair_record_register.item_id = @item_transaction.item_id
    @repair_record_register.page_no = new_page_no
    @repair_record_register = set_current_information @repair_record_register
    @repair_record_register.store_body_id = current_control_body.id
    @repair_record_register.price = (@item_transaction.amount / @item_transaction.quantity)
    respond_to do |format|
      if @repair_record_register.save
        format.html { redirect_to @repair_record_register, notice: 'Repair record register was successfully created.' }
        format.json { render :show, status: :created, location: @repair_record_register }
      else
        format.html { render :new }
        format.json { render json: @repair_record_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repair_record_registers/1
  # PATCH/PUT /repair_record_registers/1.json
  def update
    respond_to do |format|
      if @repair_record_register.update(repair_record_register_params)
        format.html { redirect_to @repair_record_register, notice: 'Repair record register was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair_record_register }
      else
        format.html { render :edit }
        format.json { render json: @repair_record_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_record_registers/1
  # DELETE /repair_record_registers/1.json
  def destroy
    @repair_record_register.destroy
    respond_to do |format|
      format.html { redirect_to office_repair_record_registers_url, notice: 'Repair record register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def print
    @repair_record_register_items = @repair_record_register.repair_record_register_items
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_record_register
      @repair_record_register = Office::RepairRecordRegister.find(params[:id])
    end

  def set_office_information
    @office = @repair_record_register.office
  end

  def new_page_no
    rrrs = office(Office::RepairRecordRegister)
    new_rrr_no = 1
    if rrrs.count > 0
      new_rrr_no = rrrs.last.page_no + 1
    end
    new_rrr_no
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_record_register_params
      params.require(:office_repair_record_register).permit(:item_transaction_id)
    end
end
