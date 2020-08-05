class ProjectStockGenerator
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform data
     ActionCable.server.broadcast "progress_channel", response: { message: "We are generating report in background.."};
   
    project_stocks = Project::Stock.where(office_id: data["office_id"])
                         .where(user_id: data["user_id"])
                         .where(fiscal_year_id: data["fiscal_year_id"])
    if project_stocks.count > 0
      project_stocks.destroy_all
    end
    project_stock = Project::Stock.new
    project_stock.office_id = data["office_id"]
    project_stock.fiscal_year_id = data["fiscal_year_id"]
    project_stock.user_id = data["user_id"]
    project_stock.store_body_id = data["store_body_id"]
    project_stock.file = false
    if project_stock.save!
      generate_stock_items project_stock
      generate_and_save_pdf project_stock
    end
     ActionCable.server.broadcast "progress_channel", response: { message: "We are generating report in background..", closed: true};
   
  end

  private

  def generate_stock_items stock
    projects = Project::Project.where(office_id: stock.office_id).where(user_id: stock.user_id).where(project_status: 0)
    projects.each do |project|
      project.project_items.each do |item|
        transactions = Project::ProjectItemTransaction.where(office_id: stock.office_id)
                           .where(fiscal_year_id: stock.fiscal_year_id)
                           .where(project_id: project.id)
                           .where(project_item_id: item.id)
                           .where("sku > 0")
        if transactions.count > 0
          stock_item = Project::StockItem.new
          stock_item.stock_id = stock.id
          stock_item.name_of_item_ne = item.name_of_item_ne
          stock_item.item_classification_no = item.item_classification_no
          stock_item.item_register_page_no = item.item_register_page_no
          stock_item.unit_ne = item.unit_ne
          stock_item.project_id = project.id
          stock_item.office_id = stock.office_id
          stock_item.user_id = stock.user_id
          stock_item.project_item_id = item.id
          stock_item.fiscal_year_id = stock.fiscal_year_id
          stock_item.store_body_id = stock.store_body_id
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
  end

  def generate_and_save_pdf stock
    data = {
        office: stock.office,
        fiscal_year: stock.fiscal_year,
        report_name: "बार्षिक मौज्दात विवरण",
        form_no: 413,
        old_form_no: 57,
        project_stock: stock
    }
    generator = PdfGenerator.new('project/stocks/show.pdf', data, {orientation: 'potrait'})
    pdf = generator.generate
    dir = Rails.root.join("pdfs", "#{stock.office.id}", "#{stock.fiscal_year.id}")
    if File.directory?(dir) == false
      FileUtils.mkdir_p dir
    end
    pdf_path = Rails.root.join("pdfs", "#{stock.office.id}", "#{stock.fiscal_year.id}", "project_stock_report.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << pdf
    end
    stock.file = pdf_path
    stock.save
  end
end