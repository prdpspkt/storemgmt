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
  end

  def generate
    @project_stocks = current(Project::Stock)
    if @project_stocks.count > 0
      @project_stocks.destroy_all
    end
    @project_stock = Project::Stock.new
    @project_stock = set_current_information @project_stock
    @project_stock.store_body_id = current_control_body.id
    @project_stock.save!
    generate_stock_items @project_stock.id
    redirect_to project_stocks_url
  end

  private

  def generate_stock_items stock_id
    @projects = office(Project::Project).where(project_status: 0)
    @projects.each do |project|
      project.project_items.each do |item|
        transactions = item.project_item_transactions.where("sku > 0")
        stock_item = Project::StockItem.new
        stock_item.stock_id = stock_id
        stock_item.project_id = project.id
        stock_item = set_current_information stock_item
        stock_item.store_body_id = current_control_body.id
        stock_item.project_item_id = item.id
        stock_item.quantity = transactions.sum(:sku)
        stock_item.rate = transactions.average(:rate)
        begin
        stock_item.amount = stock_item.quantity * stock_item.rate
        rescue Exception => error
          logger.info(error.message)
        end
        stock_item.item_id = item.item_id
        stock_item.save!
      end
    end
  end

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
