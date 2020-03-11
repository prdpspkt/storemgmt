class Office::VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = current(Office::Vendor)
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Office::Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Office::Vendor.new(vendor_params)
    @vendor.user_id = current_user.id
    @vendor.office_id = current_office.id
    @vendor.fiscal_year_id = current_fiscal_year.id
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to office_vendors_path, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to office_vendors_path, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to office_vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Office::Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:office_vendor).permit(:vendor_name,:vendor_name_en,  :vendor_registration, :vendor_pan, :vendor_address, :vendor_representive, :vendor_phone, :vendor_email)
    end
end
