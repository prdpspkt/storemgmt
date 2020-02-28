json.extract! item, :id, :name_of_item_ne, :name_of_item_en, :unit_en, :unit_ne, :item_category_id, :office_id, :user_id, :created_at, :updated_at
json.url office_item_url(item, format: :json)
