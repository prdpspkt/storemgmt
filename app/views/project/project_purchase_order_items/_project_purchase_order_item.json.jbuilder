json.extract! project_purchase_order_item, :id, :item_classification_no, :name_of_item_en, :name_of_item_ne, :specification, :unit_ne, :unit_en, :quantity, :rate, :amount, :remarks, :project_purchase_order_id, :office_id, :item_id, :fy, :fiscal_year_id, :project_id, :created_at, :updated_at
json.url project_purchase_order_item_url(project_purchase_order_item, format: :json)
