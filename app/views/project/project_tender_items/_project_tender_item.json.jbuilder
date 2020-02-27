json.extract! project_tender_item, :id, :name_of_item_ne, :name_of_item_en, :unit_ne, :unit_en, :quantity, :rate, :amount, :office_id, :user_id, :received_date, :project_purchase_tender_id, :fy, :fiscal_year_id, :created_at, :updated_at
json.url project_tender_item_url(project_tender_item, format: :json)
