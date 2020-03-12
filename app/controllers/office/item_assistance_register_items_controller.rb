class Office::ItemAssistanceRegisterItemsController < ApplicationController
  before_action :set_item_assistance_register_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /item_assistance_register_items
  # GET /item_assistance_register_items.json
  def index
    @item_assistance_register_items = ItemAssistanceRegisterItem.all
  end

  # GET /item_assistance_register_items/1
  # GET /item_assistance_register_items/1.json
  def show
    @item_assistance_register_item
  end

  # GET /item_assistance_register_items/new
  def new
    @item_assistance_register_item = ItemAssistanceRegisterItem.new
  end

  # GET /item_assistance_register_items/1/edit
  def edit
  end

  # POST /item_assistance_register_items
  # POST /item_assistance_register_items.json
  def create
    @item_assistance_register_item = ItemAssistanceRegisterItem.new(item_assistance_register_item_params)
    @item = OfficeItem.find(@item_assistance_register_item.office_item_id)
    @item_assistance_register_item.name_of_item_ne = @item.name_of_item_ne
    @item_assistance_register_item.name_of_item_en = @item.name_of_item_en
    @item_assistance_register_item.specification = @item.specification
    @item_assistance_register_item.model_no = @item.model_no
    @item_assistance_register_item.item_identification_no = @item.item_identification_no
    @item_assistance_register_item.user_id = current_user.id
    @item_assistance_register_item.fiscal_year_id = current_fiscal_year.id
    @item_assistance_register_item.office_id = current_office.id

    respond_to do |format|
      if @item_assistance_register_item.save
        format.html { redirect_to @item_assistance_register_item, notice: 'Item assistance register item was successfully created.' }
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
            @item = OfficeItem.find(@item_assistance_register_item.office_item_id)
    @item_assistance_register_item.name_of_item_ne = @item.name_of_item_ne
    @item_assistance_register_item.name_of_item_en = @item.name_of_item_en
    @item_assistance_register_item.specification = @item.specification
            @item_assistance_register_item.save
        format.html { redirect_to @item_assistance_register_item, notice: 'Item assistance register item was successfully updated.' }
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
    @item_assistance_register_item.destroy
    respond_to do |format|
      format.html { redirect_to item_assistance_register_items_url, notice: 'Item assistance register item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_assistance_register_item
      @item_assistance_register_item = ItemAssistanceRegisterItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_assistance_register_item_params
      params.require(:item_assistance_register_item).permit(:date, :order_release_no, :office_item_id, :specification, :item_identification_no, :model_no, :quantity, :amount, :taken_date, :date_to_be_returned, :returned_quantity, :returned_date, :name_of_user, :user_id, :office_id, :fy, :fiscal_year_id, :item_assistance_register_id)
    end
end
