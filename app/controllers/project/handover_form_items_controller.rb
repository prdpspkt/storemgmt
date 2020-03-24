class Office::HandoverFormItemsController < ProjectController
  before_action :set_handover_form_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_handover_form_items
  # GET /office_handover_form_items.json
  def index
    @handover_items = Office::HandoverFormItem.all
  end

  # GET /office_handover_form_items/1
  # GET /office_handover_form_items/1.json
  def show
  end

  # GET /office_handover_form_items/new
  def new
    @handover_item = Office::HandoverFormItem.new
  end

  # GET /office_handover_form_items/1/edit
  def edit
  end

  # POST /office_handover_form_items
  # POST /office_handover_form_items.json
  def create
    @transaction = Office::ItemTransaction.find(handover_item_params[:transaction_id])
    @handover_item = Office::HandoverFormItem.new(@transaction.attributes.select{|key, _| Office::HandoverFormItem.column_names.include? key})
    @handover_item = set_current_information @handover_item
    @handover_item.handover_form_id = handover_item_params[:handover_form_id]
    @handover_item.id = nil
    if @transaction.sku > handover_item_params[:quantity].to_d
      @handover_item.quantity = handover_item_params[:quantity]
      @handover_item.rate = @transaction.rate
      @handover_item.amount = @handover_item.quantity * @handover_item.rate
      @transaction.sku = @transaction.sku - @handover_item.quantity
    else
      @handover_item.quantity = @transaction.sku
      @handover_item.rate = @transaction.rate
      @handover_item.amount = @handover_item.quantity * @handover_item.rate
      @transaction.sku = 0
    end
    @handover_item.subed_from = @transaction.id
    @handover_form = Office::HandoverForm.find(@handover_item.handover_form_id)
    respond_to do |format|
      if @handover_item.save
        @transaction.save
        format.html { redirect_to @handover_form, notice: 'Office release item was successfully created.' }
        format.json { render :show, status: :created, location: @office_release_item }
      else
        flash[:error] = "Error occored while creating item."
        format.html { redirect_to @handover_form }
      end
    end
  end

  # PATCH/PUT /office_handover_form_items/1
  # PATCH/PUT /office_handover_form_items/1.json
  def update
    respond_to do |format|
      if @handover_item.update(handover_form_item_params)
        format.html { redirect_to @handover_item.office_handover_form, notice: 'Handover form item was successfully updated.' }
        format.json { render :show, status: :ok, location: @handover_item }
      else
        format.html { render :edit }
        format.json { render json: @handover_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_handover_form_items/1
  # DELETE /office_handover_form_items/1.json
  def destroy
    hf = @handover_item.handover_form
    @handover_item.destroy
    respond_to do |format|
      format.html { redirect_to hf, notice: 'Handover form item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_handover_form_item
    @handover_item = Office::HandoverFormItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def handover_item_params
    params.require(:office_handover_form_item).permit(:transaction_id, :quantity, :physical_status, :handover_form_id)
  end

end
