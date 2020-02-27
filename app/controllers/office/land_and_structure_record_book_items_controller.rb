class Office::LandAndStructureRecordBookItemsController < ApplicationController
  before_action :set_land_and_structure_record_book_item, only: [:show, :edit, :update, :destroy]

  # GET /land_and_structure_record_book_items
  # GET /land_and_structure_record_book_items.json
  def index
    @land_and_structure_record_book_items = LandAndStructureRecordBookItem.all
  end

  # GET /land_and_structure_record_book_items/1
  # GET /land_and_structure_record_book_items/1.json
  def show
  end

  # GET /land_and_structure_record_book_items/new
  def new
    @land_and_structure_record_book_item = LandAndStructureRecordBookItem.new
  end

  # GET /land_and_structure_record_book_items/1/edit
  def edit
  end

  # POST /land_and_structure_record_book_items
  # POST /land_and_structure_record_book_items.json
  def create
    @land_and_structure_record_book_item = LandAndStructureRecordBookItem.new(land_and_structure_record_book_item_params)

    respond_to do |format|
      if @land_and_structure_record_book_item.save
        format.html { redirect_to @land_and_structure_record_book_item, notice: 'Land and structure record book item was successfully created.' }
        format.json { render :show, status: :created, location: @land_and_structure_record_book_item }
      else
        format.html { render :new }
        format.json { render json: @land_and_structure_record_book_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /land_and_structure_record_book_items/1
  # PATCH/PUT /land_and_structure_record_book_items/1.json
  def update
    respond_to do |format|
      if @land_and_structure_record_book_item.update(land_and_structure_record_book_item_params)
        format.html { redirect_to @land_and_structure_record_book_item, notice: 'Land and structure record book item was successfully updated.' }
        format.json { render :show, status: :ok, location: @land_and_structure_record_book_item }
      else
        format.html { render :edit }
        format.json { render json: @land_and_structure_record_book_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /land_and_structure_record_book_items/1
  # DELETE /land_and_structure_record_book_items/1.json
  def destroy
    @land_and_structure_record_book_item.destroy
    respond_to do |format|
      format.html { redirect_to land_and_structure_record_book_items_url, notice: 'Land and structure record book item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_land_and_structure_record_book_item
      @land_and_structure_record_book_item = LandAndStructureRecordBookItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def land_and_structure_record_book_item_params
      params.require(:land_and_structure_record_book_item).permit(:district, :local_level, :ward_no, :map_sheet_no, :plot_no, :area, :type, :owner_name, :certificate_no, :received_date, :price, :structure_laying_land_area, :structure_covered_area, :structure_type, :decision_date, :structure_cost, :land_and_structure_total_cost, :evaluated_date, :evaluated_price, :remarks, :user_id, :fy, :fiscal_year_id, :office_id, :land_and_structure_record_book_id)
    end
end
