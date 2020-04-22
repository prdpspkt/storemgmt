class Office::RentalRecordRegistersController < OfficeController
  before_action :set_rental_record_register, only: [:show, :edit, :update, :destroy, :print]
  load_and_authorize_resource except: [:create, :new]
  # GET /rental_record_registers
  # GET /rental_record_registers.json
  def index
    @rental_record_registers = Office::RentalRecordRegister.all
  end

  # GET /rental_record_registers/1
  # GET /rental_record_registers/1.json
  def show
    @rental_record_register_item = Office::RentalRecordRegisterItem.new
    @rental_record_register_item.rental_record_register_id = @rental_record_register.id
    @rental_record_register_items = @rental_record_register.rental_record_register_items
  end

  # GET /rental_record_registers/new
  def new
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 47).where("sku > 0")
    @rental_record_register = Office::RentalRecordRegister.new
  end

  # GET /rental_record_registers/1/edit
  def edit
  end

  # POST /rental_record_registers
  # POST /rental_record_registers.json
  def create
    @transactions = office(Office::ItemTransaction).where(item_classification_no: 47).where("sku > 0")
    @rental_record_register = Office::RentalRecordRegister.new(rental_record_register_params)
    @transaction = Office::ItemTransaction.find(@rental_record_register.item_transaction_id)
    @rental_record_register.item_id = @transaction.item_id
    @rental_record_register = set_current_information @rental_record_register
    @rental_record_register.store_body_id = current_control_body.id
    @rental_record_register.model_no = @transaction.model
    @rental_record_register.item_identification_no = @transaction.item_identification_no
    @rental_record_register.item_register_page_no = @transaction.item.item_register_page_no
    @rental_record_register.item_classification_no = @transaction.item_classification_no

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

  def print
    @office = @rental_record_register.office
    @cb = @rental_record_register.store_body
    @fiscal_year = @rental_record_register.fiscal_year
  end

  # DELETE /rental_record_registers/1
  # DELETE /rental_record_registers/1.json
  def destroy
    @rental_record_register.destroy
    respond_to do |format|
      format.html { redirect_to office_rental_record_registers_url, notice: 'Rental record register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_record_register
      @rental_record_register = Office::RentalRecordRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_record_register_params
      params.require(:office_rental_record_register).permit(:item_transaction_id, :is_taken_in_rent, :is_given_in_rent,  :store_keeper_signed_date,  :office_chief_signed_date)
    end

end
