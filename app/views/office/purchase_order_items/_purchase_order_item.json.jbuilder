json.extract! purchase_order_item, :id, :item_classification_no, :name_of_item, :specification, :unit, :quantity, :rate, :amount, :remarks, :purchase_order_id, :office_id, :user_id, :fy, :fiscal_year_id, :created_at, :updated_at
json.url purchase_order_item_url(purchase_order_item, format: :json)
