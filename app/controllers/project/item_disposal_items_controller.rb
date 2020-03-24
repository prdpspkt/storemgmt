class Office::ItemDisposalItemsController < ProjectController
  before_action :set_item_disposal_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /item_disposal_items
  # GET /item_disposal_items.json
  def index
    @item_disposal_items = ItemDisposalItem.all
  end

  # GET /item_disposal_items/1
  # GET /item_disposal_items/1.json
  def show
  end

  # GET /item_disposal_items/new
  def new
    @item_disposal_item = ItemDisposalItem.new
  end

  # GET /item_disposal_items/1/edit
  def edit
  end

  # POST /item_disposal_items
  # POST /item_disposal_items.json
  def create
    @item_disposal_item = ItemDisposalItem.new(item_disposal_item_params)

    respond_to do |format|
      if @item_disposal_item.save
        format.html { redirect_to @item_disposal_item, notice: 'Item disposal item was successfully created.' }
        format.json { render :show, status: :created, location: @item_disposal_item }
      else
        format.html { render :new }
        format.json { render json: @item_disposal_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_disposal_items/1
  # PATCH/PUT /item_disposal_items/1.json
  def update
    respond_to do |format|
      if @item_disposal_item.update(item_disposal_item_params)
        format.html { redirect_to @item_disposal_item, notice: 'Item disposal item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_disposal_item }
      else
        format.html { render :edit }
        format.json { render json: @item_disposal_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_disposal_items/1
  # DELETE /item_disposal_items/1.json
  def destroy
    @item_disposal_item.destroy
    respond_to do |format|
      format.html { redirect_to item_disposal_items_url, notice: 'Item disposal item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_disposal_item
      @item_disposal_item = ItemDisposalItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_disposal_item_params
      params.require(:item_disposal_item).permit(:item_classification_no, :item_register_page_no, :item_id, :is_office_item, :is_project_item, :specification, :received_date, :used_year, :quantity, :amount, :current_marked_price, :reason_for_disposal, :remarks, :office_id, :user_id, :fy, :fiscal_year_id)
    end
end
