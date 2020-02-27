json.set! :data do
  json.array! @repair_application_form_items do |repair_application_form_item|
    json.partial! 'repair_application_form_items/repair_application_form_item', repair_application_form_item: repair_application_form_item
    json.url  "
              #{link_to 'Show', repair_application_form_item }
              #{link_to 'Edit', edit_repair_application_form_item_path(repair_application_form_item)}
              #{link_to 'Destroy', repair_application_form_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end