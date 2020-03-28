class Project::TenderItemsController < ProjectController
  before_action :set_tender_item, only: [:destroy, :edit, :update]

  # GET /tender_items
  # GET /tender_items.json
  def index
    @tender_items = Project::TenderItem.all
  end


  # GET /tender_items/1/edit
  def edit
  end

  # POST /tender_items
  # POST /tender_items.json
  def create
    @tender_item = Project::TenderItem.new(tender_item_params)
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
    @tender_item = update_general_information @tender_item
    @tender_item.sku = @tender_item.quantity
    respond_to do |format|
      if @tender_item.save
        format.html { redirect_to @tender_item.tender, notice: 'Project tender item was successfully created.' }
        format.json { render :show, status: :created, location: @tender_item }
      else
        format.html { redirect_to Project::Tender.find(@tender_item.tender_id) }
        format.json { render json: @tender_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if@tender_item.update(tender_item_update_params)
        format.html { redirect_to@tender_item.tender, notice: 'Project Tender Item was successfully updated.' }
        format.json { render :show, status: :ok, location:@tender_item }
      else
        format.html { render :edit }
        format.json { render json:@tender_item.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /tender_items/1
  # DELETE /tender_items/1.json
  def destroy
    tender = @tender_item.tender
    @tender_item.destroy
    respond_to do |format|
      format.html { redirect_to tender, notice: 'Project tender item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tender_item
    @tender_item = Project::TenderItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tender_item_params
    params.require(:project_tender_item).permit(:item_classification_no, :quantity, :rate, :amount, :is_vatable, :tender_id, :item_id)
  end

  def update_general_information object
    object.office_id = current_office.id
    object.user_id = current_user.id
    object.fiscal_year_id = current_fiscal_year.id
    object
  end
end
