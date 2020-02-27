class Office::OfficeItemsController < ApplicationController
  before_action :set_office_item, only: [:show, :edit, :update, :destroy]

  # GET /office_items
  # GET /office_items.json
  def index
    @office_items = OfficeItem.all
  end

  # GET /office_items/1
  # GET /office_items/1.json
  def show
  end

  # GET /office_items/new
  def new
    @office_item = OfficeItem.new
  end

  # GET /office_items/1/edit
  def edit
  end

  # POST /office_items
  # POST /office_items.json
  def create
    begin
    @office_item = OfficeItem.new(office_item_params)
    @item = Item.find(@office_item.item_id)
    @office_item.name_of_item_ne = @item.name_of_item_ne
    @office_item.name_of_item_en = @item.name_of_item_en
    @office_item.unit_ne = @item.unit_ne
    @office_item.unit_en = @item.unit_en
    @office_item.model_no = @item.model_no
    @office_item.item_identification_no = @item.item_identification_no
    @office_item.user_id = current_user.id
    @office_item.office_id = current_office.id
    @office_item.fiscal_year_id = current_fiscal_year.id
    respond_to do |format|
      if @office_item.save
        format.html { redirect_to office_items_path, notice: 'Office item was successfully created.' }
        format.json { render :show, status: :created, location: @office_item }
      else
        format.html { render :new }
        format.json { render json: @office_item.errors, status: :unprocessable_entity }
      end
    end
  rescue Exeption => error
    redirect_to :back, notice: error.message
  end
  end

  # PATCH/PUT /office_items/1
  # PATCH/PUT /office_items/1.json
  def update
    respond_to do |format|
      if @office_item.update(office_item_params)
        format.html { redirect_to office_items_path, notice: 'Office item was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_item }
      else
        format.html { render :edit }
        format.json { render json: @office_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_items/1
  # DELETE /office_items/1.json
  def destroy
    @office_item.destroy
    respond_to do |format|
      format.html { redirect_to office_items_url, notice: 'Office item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_item
      @office_item = OfficeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_item_params
      params.require(:office_item).permit(:item_id, :item_classification_no)
    end

end
