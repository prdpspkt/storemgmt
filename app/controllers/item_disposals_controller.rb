class ItemDisposalsController < ApplicationController
  before_action :set_item_disposal, only: [:show, :edit, :update, :destroy]

  # GET /item_disposals
  # GET /item_disposals.json
  def index
    @item_disposals = ItemDisposal.all
  end

  # GET /item_disposals/1
  # GET /item_disposals/1.json
  def show
  end

  # GET /item_disposals/new
  def new
    @item_disposal = ItemDisposal.new
  end

  # GET /item_disposals/1/edit
  def edit
  end

  # POST /item_disposals
  # POST /item_disposals.json
  def create
    @item_disposal = ItemDisposal.new(item_disposal_params)

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
      format.html { redirect_to item_disposals_url, notice: 'Item disposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_disposal
      @item_disposal = ItemDisposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_disposal_params
      params.require(:item_disposal).permit(:fy, :decision_date, :decision_made_by, :store_chief_name, :store_chief_designation, :store_chief_signed_date, :section_chief_name, :section_chief_designation, :section_chief_signed_date, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :office_id, :user_id, :fiscal_year_id)
    end
end
