json.extract! office_stock_item, :id, :item_register_page_no, :item_classification_no, :name_of_item, :unit, :quantity, :rate, :amount, :physical_status, :remarks, :office_id, :office_item_id, :user_id, :fiscal_year_id, :created_at, :updated_at
json.url office_stock_item_url(office_stock_item, format: :json)
