json.extract! project_stock_item, :id, :item_register_page_no, :item_classification_no, :name_of_item_en, :name_of_item_ne, :unit_en, :unit_ne, :quantity, :rate, :amount, :physical_status, :remarks, :office_id, :project_id, :item_id, :user_id, :fiscal_year_id, :created_at, :updated_at
json.url project_stock_item_url(project_stock_item, format: :json)
