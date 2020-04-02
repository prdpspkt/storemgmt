class GenerateOfficeStock
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
    office_stock.save!
    generate_stock_items office_stock
  end
private
  def generate_stock_items stock
    items = Office::Item.where(office_id: stock.office_id).where(user_id: stock.user_id)
    items.each do |item|
      transactions = item.item_transactions.where("sku > 0").where(item_classification_no: 47)
      stock_item = Office::StockItem.new
      stock_item.stock_id = stock.id
      stock_item.office_id = stock.office_id
      stock_item.user_id = stock.user_id
      stock_item.fiscal_year_id = stock.fiscal_year_id
      stock_item.store_body_id = stock.store_body_id
      stock_item.quantity = transactions.sum(:sku)
      stock_item.rate = transactions.average(:rate)
      begin
        stock_item.amount = stock_item.quantity * stock_item.rate
      rescue Exception => error
        logger.info(error.message)
      end
      stock_item.item_id = item.id
      stock_item.save!
    end
  end
end