class Office::RentalRecordRegistersController < ApplicationController
  before_action :set_rental_record_register, only: [:show, :edit, :update, :destroy]

  # GET /rental_record_registers
  # GET /rental_record_registers.json
  def index
    @rental_record_registers = RentalRecordRegister.all
  end

  # GET /rental_record_registers/1
  # GET /rental_record_registers/1.json
  def show
  end

  # GET /rental_record_registers/new
  def new
    @rental_record_register = RentalRecordRegister.new
  end

  # GET /rental_record_registers/1/edit
  def edit
  end

  # POST /rental_record_registers
  # POST /rental_record_registers.json
  def create
    @rental_record_register = RentalRecordRegister.new(rental_record_register_params)

    respond_to do |format|
      if @rental_record_register.save
        format.html { redirect_to @rental_record_register, notice: 'Rental record register was successfully created.' }
        format.json { render :show, status: :created, location: @rental_record_register }
      else
        format.html { render :new }
        format.json { render json: @rental_record_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_record_registers/1
  # PATCH/PUT /rental_record_registers/1.json
  def update
    respond_to do |format|
      if @rental_record_register.update(rental_record_register_params)
        format.html { redirect_to @rental_record_register, notice: 'Rental record register was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_record_register }
      else
        format.html { render :edit }
        format.json { render json: @rental_record_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_record_registers/1
  # DELETE /rental_record_registers/1.json
  def destroy
    @rental_record_register.destroy
    respond_to do |format|
      format.html { redirect_to rental_record_registers_url, notice: 'Rental record register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_record_register
      @rental_record_register = RentalRecordRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_record_register_params
      params.require(:rental_record_register).permit(:name_of_item, :item_classification_no, :is_taken_in_rent, :is_given_in_rent, :specification, :model_no, :item_identification_no, :item_register_page_no, :total_price, :sotre_chief_name, :store_chief_designation, :store_chief_signed_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :item_id, :office_id, :user_id, :fy, :fiscal_year_id)
    end
end
