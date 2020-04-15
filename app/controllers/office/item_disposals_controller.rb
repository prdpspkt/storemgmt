class Office::ItemDisposalsController < OfficeController
  before_action :set_item_disposal, only: [:show, :edit, :update, :destroy, :accept, :transaction, :print]
  load_and_authorize_resource except: [:create, :new]
  # GET /item_disposals
  # GET /item_disposals.json
  def index
    @item_disposals = Office::ItemDisposal.all
  end

  # GET /item_disposals/1
  # GET /item_disposals/1.json
  def show
    @item_disposal_item = Office::ItemDisposalItem.new
    @items = Office::ItemTransaction.where(:item_classification_no => 47).where("sku > 0").where(transaction_type: 1)
    @item_disposal_item.item_disposal_id = @item_disposal.id
  end

  # GET /item_disposals/new
  def new
    @item_disposal = Office::ItemDisposal.new
  end

  # GET /item_disposals/1/edit
  def edit
  end

  # POST /item_disposals
  # POST /item_disposals.json
  def create
    @item_disposal = Office::ItemDisposal.new(item_disposal_params)
    @item_disposal = set_current_information @item_disposal
    @item_disposal.store_body_id = current_control_body.id
    respond_to do |format|
      if @item_disposal.save
        format.html { redirect_to @item_disposal, notice: 'Item disposal was successfully created.' }
        format.json { render :show, status: :created, location: @item_disposal }
      else
        format.html { render :new }
        format.json { render json: @item_disposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_disposals/1
  # PATCH/PUT /item_disposals/1.json
  def update
    respond_to do |format|
      if @item_disposal.update(item_disposal_params)
        format.html { redirect_to @item_disposal, notice: 'Item disposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_disposal }
      else
        format.html { render :edit }
        format.json { render json: @item_disposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_disposals/1
  # DELETE /item_disposals/1.json
  def destroy
    @item_disposal.destroy
    respond_to do |format|
      format.html { redirect_to office_item_disposals_url, notice: 'Item disposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    if @item_disposal.entry_generated != true
      if @item_disposal.accepted == true
        @item_disposal.accepted = false
        @item_disposal.save
        redirect_to @item_disposal, notice: "सफलता पुर्वक अस्वीकृत भयो" and return
      else
        @item_disposal.accepted = true
        @item_disposal.save
        redirect_to @item_disposal, notice: "सफलता पुर्वक स्वीकृत भयो" and return
      end
    end

  end

  def transaction
    @item_disposal.disposal_items.each do |item|
      transaction = item.item_transaction
      new_transaction = Office::ItemTransaction.new(transaction.attributes.select { |key, _| Office::ItemTransaction.column_names.include? key })
      new_transaction.id = nil
      new_transaction.quantity = item.quantity
      new_transaction.amount = item.amount
      new_transaction.transaction_type = -1
      new_transaction.store_body_id = current_control_body.id
      new_transaction.remarks = "मिति #{ ndate item.item_disposal.decision_date} को निर्णयबाट निसर्ग/मिन्हा भएको"
      new_transaction.transaction_date = item.item_disposal.office_chief_signed_date
      item.new_item_transaction_id = new_transaction.id
      new_transaction.save
    end
    @item_disposal.entry_generated = true
    @item_disposal.save
    redirect_to @item_disposal, notice: 'अभिलेख जिन्सी खातामा प्रविष्ट भयो |'
  end

  def print
    @office = @item_disposal.office
    @fiscal_year = @item_disposal.fiscal_year
    @report_name = "जिन्सी मिन्हा/निसर्ग फाराम"
    @form_no = "४१०"
    @old_form_no = "५०"
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "item_disposal", layout: "pdf_print", orientation: "landscape", margin: { left: '30mm'}
      end
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_disposal
    @item_disposal = Office::ItemDisposal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_disposal_params
    params.require(:office_item_disposal).permit(:decision_date, :decision_made_by, :store_keeper_signed_date, :section_chief_signed_date, :office_chief_signed_date, :description)
  end
end
