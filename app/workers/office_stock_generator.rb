class OfficeStockGenerator
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform data
    office_stocks = Office::Stock.where(office_id: data["office_id"])
                        .where(user_id: data["user_id"])
                        .where(fiscal_year_id: data["fiscal_year_id"])
    if office_stocks.count > 0
      office_stocks.destroy_all
    end
    office_stock = Office::Stock.new
    office_stock.office_id = data["office_id"]
    office_stock.fiscal_year_id = data["fiscal_year_id"]
    office_stock.user_id = data["user_id"]
    office_stock.store_body_id = data["store_body_id"]
    office_stock.file = false
    if office_stock.save!
      generate_stock_items office_stock
      generate_and_save_pdf office_stock
    end

  end

  private

  def generate_stock_items stock
    items = Office::Item.where(office_id: stock.office_id).where(user_id: stock.user_id).where(item_classification_no: 47)
    items.each do |item|
      transactions = item.item_transactions.where("sku > 0").where(item_classification_no: 47)
      stock_item = Office::StockItem.new
      stock_item.name_of_item_ne = item.name_of_item_ne
      stock_item.item_register_page_no = item.item_register_page_no
      stock_item.item_classification_no = item.item_classification_no
      stock_item.unit_ne = item.unit_ne
      stock_item.stock_id = stock.id
      stock_item.office_id = stock.office_id
      stock_item.user_id = stock.user_id
      stock_item.fiscal_year_id = stock.fiscal_year_id
      stock_item.store_body_id = stock.store_body_id
      stock_item.quantity = transactions.sum(:sku)
      stock_item.rate = transactions.sum(:amount)/transactions.sum(:quantity)
      begin
        stock_item.amount = stock_item.quantity * stock_item.rate
      rescue Exception => error
        logger.info(error.message)
      end
      stock_item.item_id = item.id
      stock_item.save!
    end
  end

  def generate_and_save_pdf stock
    data = {
        office: stock.office,
        fiscal_year: stock.fiscal_year,
        report_name: "बार्षिक मौज्दात विवरण",
        form_no: 413,
        old_form_no: 57,
        office_stock: stock
    }
    generator = PdfGenerator.new('office/stocks/print.pdf', data, "portrait")
    pdf = generator.generate
    dir = Rails.root.join("pdfs", "#{stock.office.id}", "#{stock.fiscal_year.id}")
    if File.directory?(dir) == false
      FileUtils.mkdir_p dir
    end
    pdf_path = Rails.root.join("pdfs", "#{stock.office.id}", "#{stock.fiscal_year.id}", "office_stock_report.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << pdf
    end
    stock.file = pdf_path
    stock.save
  end
end