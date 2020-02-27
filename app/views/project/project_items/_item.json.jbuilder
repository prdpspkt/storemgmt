json.extract! item, :id, :name_of_item_ne, :name_of_item_en, :unit_en, :unit_ne, :item_category_id, :item_register_page_no,  :office_id, :user_id, :created_at, :updated_at
json.url item_url(item, format: :json)
