class ProjectStocksController < ApplicationController
  before_action :set_project_stock, only: [:show, :edit, :update, :destroy]

  # GET /project_stocks
  # GET /project_stocks.json
  def index
    @project_stocks = ProjectStock.all
  end

  # GET /project_stocks/1
  # GET /project_stocks/1.json
  def show
  end

  # GET /project_stocks/new
  def new
    @project_stock = ProjectStock.new
  end

  # GET /project_stocks/1/edit
  def edit
  end

  # POST /project_stocks
  # POST /project_stocks.json
  def create
    @project_stock = ProjectStock.new(project_stock_params)

    respond_to do |format|
      if @project_stock.save
        format.html { redirect_to @project_stock, notice: 'Project stock was successfully created.' }
        format.json { render :show, status: :created, location: @project_stock }
      else
        format.html { render :new }
        format.json { render json: @project_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_stocks/1
  # PATCH/PUT /project_stocks/1.json
  def update
    respond_to do |format|
      if @project_stock.update(project_stock_params)
        format.html { redirect_to @project_stock, notice: 'Project stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_stock }
      else
        format.html { render :edit }
        format.json { render json: @project_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_stocks/1
  # DELETE /project_stocks/1.json
  def destroy
    @project_stock.destroy
    respond_to do |format|
      format.html { redirect_to project_stocks_url, notice: 'Project stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_stock
      @project_stock = ProjectStock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_stock_params
      params.require(:project_stock).permit(:fy, :store_chief_name, :store_chief_designation, :store_chief_signed_date, :section_chief_name, :section_chief_signed_date, :section_chief_degination, :office_chief_name, :office_chief_designation, :office_chief_signed_date, :office_id, :project_id, :user_id, :fiscal_year_id, :item_id, :marked_as_final)
    end
end
