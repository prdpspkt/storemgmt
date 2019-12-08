class OfficeItemEvaluationItemsController < ApplicationController
  before_action :set_office_item_evaluation_item, only: [:show, :edit, :update, :destroy]

  # GET /office_item_evaluation_items
  # GET /office_item_evaluation_items.json
  def index
    @office_item_evaluation_items = OfficeItemEvaluationItem.all
  end

  # GET /office_item_evaluation_items/1
  # GET /office_item_evaluation_items/1.json
  def show
  end

  # GET /office_item_evaluation_items/new
  def new
    @office_item_evaluation_item = OfficeItemEvaluationItem.new
  end

  # GET /office_item_evaluation_items/1/edit
  def edit
  end

  # POST /office_item_evaluation_items
  # POST /office_item_evaluation_items.json
  def create
    @office_item_evaluation_item = OfficeItemEvaluationItem.new(office_item_evaluation_item_params)

    respond_to do |format|
      if @office_item_evaluation_item.save
        format.html { redirect_to @office_item_evaluation_item, notice: 'Office item evaluation item was successfully created.' }
        format.json { render :show, status: :created, location: @office_item_evaluation_item }
      else
        format.html { render :new }
        format.json { render json: @office_item_evaluation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_item_evaluation_items/1
  # PATCH/PUT /office_item_evaluation_items/1.json
  def update
    respond_to do |format|
      if @office_item_evaluation_item.update(office_item_evaluation_item_params)
        format.html { redirect_to @office_item_evaluation_item, notice: 'Office item evaluation item was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_item_evaluation_item }
      else
        format.html { render :edit }
        format.json { render json: @office_item_evaluation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_item_evaluation_items/1
  # DELETE /office_item_evaluation_items/1.json
  def destroy
    @office_item_evaluation_item.destroy
    respond_to do |format|
      format.html { redirect_to office_item_evaluation_items_url, notice: 'Office item evaluation item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_item_evaluation_item
      @office_item_evaluation_item = OfficeItemEvaluationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_item_evaluation_item_params
      params.require(:office_item_evaluation_item).permit(:item_classification_no, :item_register_page_no, :name_of_item, :unit, :quantity, :amount, :mached, :unmatched, :decreased_quantity, :increased_quantity, :decreased_increased_quantity, :working, :notworking, :to_be_repaired, :to_be_auctioned, :to_be_dispose, :to_be_conserved, :total_amount, :remarks, :item_id, :office_item_id, :user_id, :office_id, :fy, :fiscal_year_id)
    end
end
