class Office::StockItemsController < ProjectController
  before_action :set_office_stock_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_stock_items
  # GET /office_stock_items.json
  def index
    @office_stock_items = OfficeStockItem.all
  end

  # GET /office_stock_items/1
  # GET /office_stock_items/1.json
  def show
  end

  # GET /office_stock_items/new
  def new
    @office_stock_item = OfficeStockItem.new
  end

  # GET /office_stock_items/1/edit
  def edit
  end

  # POST /office_stock_items
  # POST /office_stock_items.json
  def create
    @office_stock_item = OfficeStockItem.new(office_stock_item_params)

    respond_to do |format|
      if @office_stock_item.save
        format.html { redirect_to @office_stock_item, notice: 'Office stock item was successfully created.' }
        format.json { render :show, status: :created, location: @office_stock_item }
      else
        format.html { render :new }
        format.json { render json: @office_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_stock_items/1
  # PATCH/PUT /office_stock_items/1.json
  def update
    respond_to do |format|
      if @office_stock_item.update(office_stock_item_params)
        format.html { redirect_to @office_stock_item, notice: 'Office stock item was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_stock_item }
      else
        format.html { render :edit }
        format.json { render json: @office_stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_stock_items/1
  # DELETE /office_stock_items/1.json
  def destroy
    @office_stock_item.destroy
    respond_to do |format|
      format.html { redirect_to office_stock_items_url, notice: 'Office stock item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_stock_item
      @office_stock_item = OfficeStockItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_stock_item_params
      params.require(:office_stock_item).permit(:item_register_page_no, :item_classification_no, :name_of_item, :unit, :quantity, :rate, :amount, :physical_status, :remarks, :office_id, :office_item_id, :user_id, :fiscal_year_id)
    end
end
