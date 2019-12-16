json.extract! office_item, :id, :name_of_item_ne, :name_of_item_en, :unit_ne, :unit_en, :item_register_page_no, :item_classification_no, :to_be_repaired, :to_be_auctioned, :to_be_conserved, :working, :not_working, :item_id, :user_id, :office_id, :fiscal_year_id, :created_at, :updated_at
json.url office_item_url(office_item, format: :json)
