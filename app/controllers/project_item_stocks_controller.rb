class ProjectItemStocksController < ApplicationController
  before_action :set_project_item_stock, only: [:show, :edit, :update, :destroy]

  # GET /project_item_stocks
  # GET /project_item_stocks.json
  def index
    @project_item_stocks = ProjectItemStock.all
  end

  # GET /project_item_stocks/1
  # GET /project_item_stocks/1.json
  def show
  end

  # GET /project_item_stocks/new
  def new
    @project_item_stock = ProjectItemStock.new
  end

  # GET /project_item_stocks/1/edit
  def edit
  end

  # POST /project_item_stocks
  # POST /project_item_stocks.json
  def create
    @project_item_stock = ProjectItemStock.new(project_item_stock_params)

    respond_to do |format|
      if @project_item_stock.save
        format.html { redirect_to @project_item_stock, notice: 'Project item stock was successfully created.' }
        format.json { render :show, status: :created, location: @project_item_stock }
      else
        format.html { render :new }
        format.json { render json: @project_item_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_item_stocks/1
  # PATCH/PUT /project_item_stocks/1.json
  def update
    respond_to do |format|
      if @project_item_stock.update(project_item_stock_params)
        format.html { redirect_to @project_item_stock, notice: 'Project item stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_item_stock }
      else
        format.html { render :edit }
        format.json { render json: @project_item_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_item_stocks/1
  # DELETE /project_item_stocks/1.json
  def destroy
    @project_item_stock.destroy
    respond_to do |format|
      format.html { redirect_to project_item_stocks_url, notice: 'Project item stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_item_stock
      @project_item_stock = ProjectItemStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_item_stock_params
      params.require(:project_item_stock).permit(:quantity, :rate, :amount, :item_id, :project_item_id, :office_id, :user_id, :fiscal_year_id)
    end
end
