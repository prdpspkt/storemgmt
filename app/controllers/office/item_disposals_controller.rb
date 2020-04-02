class Office::ItemDisposalsController < ApplicationController
  before_action :set_item_disposal, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :new]
  # GET /item_disposals
  # GET /item_disposals.json
  def index
    @item_disposals = Office::ItemDisposal.all
  end

  # GET /item_disposals/1
  # GET /item_disposals/1.json
  def show
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
      format.html { redirect_to item_disposals_url, notice: 'Item disposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_disposal
      @item_disposal = Office::ItemDisposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_disposal_params
      params.require(:office_item_disposal).permit( :decision_date, :decision_made_by, :store_keeper_signed_date, :section_chief_signed_date,  :office_chief_signed_date, :description)
    end
end
