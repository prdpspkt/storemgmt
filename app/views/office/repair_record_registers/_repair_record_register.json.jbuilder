json.extract! repair_record_register, :id, :page_no,  :item_identification, :model, :item_register_page_no, :price
json.url office_repair_record_register_url(repair_record_register, format: :json)
