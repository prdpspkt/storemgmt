class Office::RepairRecordRegistersController < ApplicationController
  before_action :set_repair_record_register, only: [:show, :edit, :update, :destroy]

  # GET /repair_record_registers
  # GET /repair_record_registers.json
  def index
    @repair_record_registers = RepairRecordRegister.all
  end

  # GET /repair_record_registers/1
  # GET /repair_record_registers/1.json
  def show
  end

  # GET /repair_record_registers/new
  def new
    @repair_record_register = RepairRecordRegister.new
  end

  # GET /repair_record_registers/1/edit
  def edit
  end

  # POST /repair_record_registers
  # POST /repair_record_registers.json
  def create
    @repair_record_register = RepairRecordRegister.new(repair_record_register_params)

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
      format.html { redirect_to repair_record_registers_url, notice: 'Repair record register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_record_register
      @repair_record_register = RepairRecordRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_record_register_params
      params.require(:repair_record_register).permit(:name_of_item, :page_no, :specificaiton, :item_identification, :model, :item_register_page_no, :price, :store_chief_name, :sotre_chief_designation, :store_chief_signed_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :user_id, :office_id, :fy, :fiscal_year_id, :month, :year)
    end
end
