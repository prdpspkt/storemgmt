class Office::FiscalYearsController < ApplicationController
  before_action :set_fiscal_year, only: [:show, :edit, :update, :destroy]

  # GET /fiscal_years
  # GET /fiscal_years.json
  def index
    @fiscal_years = FiscalYear.all
  end

  # GET /fiscal_years/1
  # GET /fiscal_years/1.json
  def show
  end

  # GET /fiscal_years/new
  def new
    @fiscal_year = FiscalYear.new
  end

  # GET /fiscal_years/1/edit
  def edit
  end

  # POST /fiscal_years
  # POST /fiscal_years.json
  def create
    @fiscal_year = FiscalYear.new(fiscal_year_params)
    @fiscal_year.office_id = current_office.id
    respond_to do |format|
      if @fiscal_year.save
        if current_office.fiscal_years.count == 1
          @active_fiscal_year = ActiveFiscalYear.new
          @active_fiscal_year.fy = @fiscal_year.fy
          @active_fiscal_year.fiscal_year_id = @fiscal_year.id
          @active_fiscal_year.office_id = @fiscal_year.office_id
          @active_fiscal_year.save
        end
        format.html { redirect_to new_store_body_path, notice: 'Fiscal year was successfully created.' }
        format.json { render :show, status: :created, location: @fiscal_year }
      else
        format.html { render :new }
        format.json { render json: @fiscal_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiscal_years/1
  # PATCH/PUT /fiscal_years/1.json
  def update
    respond_to do |format|
      if @fiscal_year.update(fiscal_year_params)
        format.html { redirect_to @fiscal_year, notice: 'Fiscal year was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiscal_year }
      else
        format.html { render :edit }
        format.json { render json: @fiscal_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiscal_years/1
  # DELETE /fiscal_years/1.json
  def destroy
    @fiscal_year.destroy
    respond_to do |format|
      format.html { redirect_to fiscal_years_url, notice: 'Fiscal year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiscal_year
      @fiscal_year = FiscalYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fiscal_year_params
      params.require(:fiscal_year).permit(:fy)
    end
end
