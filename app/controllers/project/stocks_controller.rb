class Project::StocksController < ProjectController
  before_action :set_project_stock, only: [:show, :edit, :update, :destroy]
  before_action :set_office_information, only: [:show]
  load_and_authorize_resource except: [:create, :new]
  # GET /project_stocks
  # GET /project_stocks.json
  def index
    @project_stocks = Project::Stock.all
  end

  # GET /project_stocks/P
  # GET /project_stocks/1.json
  def show
    @office = current_office
    @fiscal_year = @project_stock.fiscal_year
    @report_name = "वार्षिक मौज्दात विवरण (आयोजनागत)"
    @old_form_no = "57"
    @form_no = "113"
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'item_stock_project_wise', layout: 'pdf_print',  margin: {right: '10mm', left: "20mm"}
      end
    end

  end

  def generate
    data = {
        office_id: current_office.id,
        user_id: current_user.id,
        store_body_id: current_control_body.id,
        fiscal_year_id: current_fiscal_year.id
    }
    GenerateProjectStock.perform_async(data)
    redirect_to project_stocks_url, notice: "We are generating stock report in background please come back after few Minutes."
  end

  private


  # Use callbacks to share common setup or constraints between actions.
  def set_project_stock
    @project_stock = Project::Stock.find(params[:id])
  end

  def set_office_information
     @office = current_office
    @fiscal_year = @project_stock.fiscal_year
    @cb = @project_stock.store_body
  end

end
