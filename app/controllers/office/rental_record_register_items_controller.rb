class Office::RentalRecordRegisterItemsController < OfficeController
  before_action :set_rental_record_register_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /rental_record_register_items
  # GET /rental_record_register_items.json
  def index
    @rental_record_register_items = RentalRecordRegisterItem.all
  end

  # GET /rental_record_register_items/1
  # GET /rental_record_register_items/1.json
  def show
  end

  # GET /rental_record_register_items/new
  def new
    @rental_record_register_item = RentalRecordRegisterItem.new
  end

  # GET /rental_record_register_items/1/edit
  def edit
  end

  # POST /rental_record_register_items
  # POST /rental_record_register_items.json
  def create
    @rental_record_register_item = RentalRecordRegisterItem.new(rental_record_register_item_params)

    respond_to do |format|
      if @rental_record_register_item.save
        format.html { redirect_to @rental_record_register_item, notice: 'Rental record register item was successfully created.' }
        format.json { render :show, status: :created, location: @rental_record_register_item }
      else
        format.html { render :new }
        format.json { render json: @rental_record_register_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_record_register_items/1
  # PATCH/PUT /rental_record_register_items/1.json
  def update
    respond_to do |format|
      if @rental_record_register_item.update(rental_record_register_item_params)
        format.html { redirect_to @rental_record_register_item, notice: 'Rental record register item was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_record_register_item }
      else
        format.html { render :edit }
        format.json { render json: @rental_record_register_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_record_register_items/1
  # DELETE /rental_record_register_items/1.json
  def destroy
    @rental_record_register_item.destroy
    respond_to do |format|
      format.html { redirect_to rental_record_register_items_url, notice: 'Rental record register item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_record_register_item
      @rental_record_register_item = RentalRecordRegisterItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_record_register_item_params
      params.require(:rental_record_register_item).permit(:date, :name_of_vendor, :address_of_vendor, :approval_date, :start_date, :end_date, :unit, :duration, :rate, :total_amount, :receipt_or_voucher_no, :total_amount, :returned_date, :remarks, :user_id, :office_id, :fy, :fiscal_year_id, :rental_record_register_id)
    end
end
