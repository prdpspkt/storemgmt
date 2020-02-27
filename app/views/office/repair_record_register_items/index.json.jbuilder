json.set! :data do
  json.array! @repair_record_register_items do |repair_record_register_item|
    json.partial! 'repair_record_register_items/repair_record_register_item', repair_record_register_item: repair_record_register_item
    json.url  "
              #{link_to 'Show', repair_record_register_item }
              #{link_to 'Edit', edit_repair_record_register_item_path(repair_record_register_item)}
              #{link_to 'Destroy', repair_record_register_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end