json.extract! personnel, :id, :name_ne, :name_en, :post, :phone, :address, :level_class, :service, :group, :sub_group, :ctroll, :created_at, :updated_at
json.url office_personnel_url(personnel, format: :json)
