class Office::ItemAssistanceRegisterItemsController < ProjectController
  before_action :set_item_assistance_register_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /item_assistance_register_items
  # GET /item_assistance_register_items.json
  def index
    @item_assistance_register_items = Office::ItemAssistanceRegisterItem.all
  end

  # GET /item_assistance_register_items/1
  # GET /item_assistance_register_items/1.json
  def show
    @item_assistance_register_item
  end

  # GET /item_assistance_register_items/new
  def new
    @item_assistance_register_item = Office::ItemAssistanceRegisterItem.new
  end

  # GET /item_assistance_register_items/1/edit
  def edit
  end

  # POST /item_assistance_register_items
  # POST /item_assistance_register_items.json
  def create
    @item_transaction = Office::ItemTransaction.find(params[:office_item_assistance_register_item][:item_transaction_id])
    @item_assistance_register_item = Office::ItemAssistanceRegisterItem.new(@item_transaction.attributes.select{|key, _| Office::ItemAssistanceRegisterItem.column_names.include? key})
    @item_assistance_register_item.id = nil
    @item_assistance_register_item.quantity = item_assistance_register_item_params[:quantity]
    @item_assistance_register_item.amount = @item_transaction.rate * item_assistance_register_item_params[:quantity].to_d
    @item_assistance_register_item.item_assistance_register_id = item_assistance_register_item_params[:item_assistance_register_id]
    @item_assistance_register_item.order_release_no = item_assistance_register_item_params[:order_release_no]
    @item_assistance_register_item.taken_date = item_assistance_register_item_params[:taken_date]
    @item_assistance_register_item.date_to_be_returned = item_assistance_register_item_params[:date_to_be_returned]
    @item_assistance_register_item.item_transaction_id = @item_transaction.id
    @item_transaction.in_use = true
    respond_to do |format|
      if @item_assistance_register_item.save
        @item_transaction.save
        format.html { redirect_to @item_assistance_register_item.item_assistance_register, notice: 'Item assistance register item was successfully created.' }
        format.json { render :show, status: :created, location: @item_assistance_register_item }
      else
        format.html { render :new }
        format.json { render json: @item_assistance_register_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_assistance_register_items/1
  # PATCH/PUT /item_assistance_register_items/1.json
  def update
    respond_to do |format|
      if @item_assistance_register_item.update(item_assistance_register_item_params)
        format.html { redirect_to @item_assistance_register_item.item_assistance_register, notice: 'Item assistance register item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_assistance_register_item }
      else
        format.html { render :edit }
        format.json { render json: @item_assistance_register_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_assistance_register_items/1
  # DELETE /item_assistance_register_items/1.json
  def destroy
    iar = @item_assistance_register_item.item_assistance_register
    @item_assistance_register_item.destroy
    respond_to do |format|
      format.html { redirect_to iar, notice: 'Item assistance register item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_assistance_register_item
    @item_assistance_register_item = Office::ItemAssistanceRegisterItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_assistance_register_item_params
    params.require(:office_item_assistance_register_item).permit(:date, :order_release_no, :item_transaction_id, :quantity, :amount, :taken_date, :date_to_be_returned, :returned_quantity, :returned_date,:returned_by, :item_assistance_register_id)
  end
end
