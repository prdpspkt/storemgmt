class OfficeReleaseItemsController < ApplicationController
  before_action :set_office_release_item, only: [:show, :edit, :update, :destroy]

  # GET /office_release_items
  # GET /office_release_items.json
  def index
    @office_release_items = OfficeReleaseItem.all
  end

  # GET /office_release_items/1
  # GET /office_release_items/1.json
  def show
  end

  # GET /office_release_items/new
  def new
    @office_release_item = OfficeReleaseItem.new
  end

  # GET /office_release_items/1/edit
  def edit
  end

  # POST /office_release_items
  # POST /office_release_items.json
  def create
    office_item_id = params[:office_release_item][:office_item_id]
    quantity = (params[:office_release_item][:quantity]).to_d
    @incomes = Oeirt.where(office_item_id: office_item_id)
                   .where(transaction_type: 1)
                   .where("sku > 0")
    @incomes.each do |item|
      if item.sku >= quantity
        office_release_item = OfficeReleaseItem.new(office_release_item_params)
        office_release_item.item_classification_no = 52
        office_release_item.office_id = current_office.id
        office_release_item.quantity = quantity
        office_release_item.rate = item.rate
        office_release_item.amount = quantity * item.rate
        office_release_item = create_office_release_item(office_release_item)
        office_release_item.released_from = item.id
        office_release_item.save
        item.sku = item.sku - quantity
        item.save
        quantity = 0
        break;
      end

      if (item.sku < quantity && item.sku > 0)
        office_release_item = OfficeReleaseItem.new(office_release_item_params)
        office_release_item.quantity = item.sku
        office_release_item.rate = item.rate
        office_release_item.released_from = item.id
        office_release_item.item_classification_no = 52
        office_release_item.office_id = current_office.id
        office_release_item.amount = item.sku * item.rate
        office_release_item = create_office_release_item(office_release_item)
        office_release_item.save
        quantity = quantity - item.sku
        item.sku = 0
        item.save
      end
    end

    @rf = OfficeRelease.find(params[:office_release_item][:office_release_id])
    respond_to do |format|
      format.html { redirect_to @rf, notice: 'Office release item was successfully created.' }
      format.json { render :show, status: :created, location: @office_release_item }
    end
  end

  # PATCH/PUT /office_release_items/1
  # PATCH/PUT /office_release_items/1.json
  def update
    @item = OfficeItem.find(@office_release_item.office_item_id)
    @office_release_item.item_id = @item.item_id
    @office_release_item.office_item_id = @item.id
    @office_release_item.name_of_item_ne = @item.name_of_item_ne
    @office_release_item.name_of_item_en = @item.name_of_item_en
    @office_release_item.item_register_page_no = @item.item_register_page_no
    @office_release_item.unit_ne = @item.unit_ne
    @office_release_item.unit_en = @item.unit_ne
    @rf = OfficeRelease.find(@office_release_item.office_release_id)

    respond_to do |format|
      if @office_release_item.update(office_release_item_params)
        format.html { redirect_to @rf, notice: 'Office release item was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_release_item }
      else
        format.html { render :edit }
        format.json { render json: @office_release_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_release_items/1
  # DELETE /office_release_items/1.json
  def destroy
    @id = @office_release_item.id
    @office_release_item.destroy
    respond_to do |format|
      format.html { redirect_to office_release_items_url, notice: 'Office release item was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_release_item
    @office_release_item = OfficeReleaseItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def office_release_item_params
    params.require(:office_release_item).permit(:office_item_id, :quantity, :remarks, :office_release_id)
  end

  def create_office_release_item ori
    @item = OfficeItem.find(ori.office_item_id)
    ori.item_id = @item.item_id
    ori.office_item_id = @item.id
    ori.name_of_item_ne = @item.name_of_item_ne
    ori.name_of_item_en = @item.name_of_item_en
    ori.item_register_page_no = @item.item_register_page_no
    ori.unit_ne = @item.unit_ne
    ori.unit_en = @item.unit_ne
    ori.fiscal_year_id = current_fiscal_year.id
    ori.user_id = current_user.id
    ori
  end
end


