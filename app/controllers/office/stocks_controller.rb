class Office::StocksController < ApplicationController
  before_action :set_office_stock, only: [:show, :edit, :update, :destroy, :print]
  before_action :set_office_information, only: [:show]
  load_and_authorize_resource except: [:create, :new]
  # GET /office_stocks
  # GET /office_stocks.json
  def index
    @office_stocks = Office::Stock.all
  end

  # GET /office_stocks/P
  # GET /office_stocks/1.json
  def show
  end

  def generate
    data = {
        office_id: current_office.id,
        fiscal_year_id: current_fiscal_year.id,
        store_body_id: current_control_body.id,
        user_id: current_user.id
    }
    GenerateOfficeStock.perform_async(data)
    redirect_to office_stocks_url, notice: "We are generating stock report in background please refresh page after few minutes. Thanks"
  end

  def print
    @office = @office_stock.office
    @fiscal_year = @office_stock.fiscal_year
    @report_name = "वार्षिक मौज्दात विवरण"
    @form_no = 113
    @old_form_no = 57
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "office_yearly_stock", layout: "pdf_print", margin: {left: "20mm"}
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office_stock
    @office_stock = Office::Stock.find(params[:id])
  end

  def set_office_information
    @office = current_office
    @fiscal_year = @office_stock.fiscal_year
    @cb = @office_stock.store_body
  end

end
