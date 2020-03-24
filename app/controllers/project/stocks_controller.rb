class Office::StocksController < ProjectController
  before_action :set_office_stock, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_stocks
  # GET /office_stocks.json
  def index
    @office_stocks = OfficeStock.all
  end

  # GET /office_stocks/1
  # GET /office_stocks/1.json
  def show
  end

  # GET /office_stocks/new
  def new
    @office_stock = OfficeStock.new
  end

  # GET /office_stocks/1/edit
  def edit
  end

  # POST /office_stocks
  # POST /office_stocks.json
  def create
    @office_stock = OfficeStock.new(office_stock_params)

    respond_to do |format|
      if @office_stock.save
        format.html { redirect_to @office_stock, notice: 'Office stock was successfully created.' }
        format.json { render :show, status: :created, location: @office_stock }
      else
        format.html { render :new }
        format.json { render json: @office_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_stocks/1
  # PATCH/PUT /office_stocks/1.json
  def update
    respond_to do |format|
      if @office_stock.update(office_stock_params)
        format.html { redirect_to @office_stock, notice: 'Office stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_stock }
      else
        format.html { render :edit }
        format.json { render json: @office_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_stocks/1
  # DELETE /office_stocks/1.json
  def destroy
    @office_stock.destroy
    respond_to do |format|
      format.html { redirect_to office_stocks_url, notice: 'Office stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_stock
      @office_stock = OfficeStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_stock_params
      params.require(:office_stock).permit(:fy, :store_chief_name, :store_chief_designation, :store_chief_sign_date, :section_chief_name, :section_chief_designation, :section_chief_signed_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :office_id, :user_id, :fiscal_year_id)
    end
end
