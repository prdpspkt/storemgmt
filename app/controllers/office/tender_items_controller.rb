class Office::TenderItemsController < OfficeController
  before_action :set_tender_item, only: [:destroy, :edit, :update]

  # GET /tender_items
  # GET /tender_items.json
  def index
    @tender_items = Office::TenderItem.all
  end


  # GET /tender_items/1/edit
  def edit
  end

  # POST /tender_items
  # POST /tender_items.json
  def create
    @tender_item = Office::TenderItem.new(tender_item_params)
    @tender_item.amount_without_vat = @tender_item.rate * @tender_item.quantity
    if @tender_item.is_vatable
      @tender_item.vat = @tender_item.amount_without_vat * 0.13
      @tender_item.amount = @tender_item.amount_without_vat + @tender_item.vat
    else
      @tender_item.amount = @tender_item.amount_without_vat
    end
    if @tender_item.other_expense.present?
      @tender_item.total_amount = @tender_item.amount + @tender_item.other_expense
    else
      @tender_item.total_amount = @tender_item.amount
    end
    @tender_item = set_current_information @tender_item
    @tender_item.sku = @tender_item.quantity
    @tender_item.item_id = office_item(@tender_item.pool_item_id).id
    respond_to do |format|
      if @tender_item.save!
        format.html { redirect_to @tender_item.tender, notice: 'Office tender item was successfully created.' }
        format.json { render :show, status: :created, location: @tender_item }
      else
        format.html { redirect_to Office::Tender.find(@tender_item.tender_id) }
        format.json { render json: @tender_item.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /tender_items/1
  # DELETE /tender_items/1.json
  def destroy
    tender = @tender_item.tender
    @tender_item.destroy
    respond_to do |format|
      format.html { redirect_to tender, notice: 'Office tender item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tender_item
    @tender_item = Office::TenderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tender_item_params
    params.require(:office_tender_item).permit(:item_classification_no, :quantity, :rate, :amount, :is_vatable, :tender_id,:pool_item_id)
  end


  def office_item pool_item_id
    @office_item = current(Office::Item).where(pool_item_id: pool_item_id).first
    if @office_item.blank?
      pool_item = Office::PoolItem.find(pool_item_id)
      @office_item = Office::Item.new(pool_item.attributes.select { |key, _| Office::Item.column_names.include? key })
      @office_item.id = nil
      @office_item.pool_item_id = pool_item_id
      @office_item = set_current_information @office_item
      @office_item.item_register_page_no = office_item_register_page pool_item_id
      @office_item.save!
    end
    @office_item
  end

  def office_item_register_page pool_item_id
    @page_no = 1
    @pool_item = Office::PoolItem.find(pool_item_id)
    if @pool_item.item_classification_no == 408
      @office_items = office(Office::Item)
    else
      @office_items = current(Office::Item)
    end
    if @office_items.count.positive?
      @page_no = @office_items.last.item_register_page_no + 1
    end
    @page_no
  end
end
