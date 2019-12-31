json.set! :data do
  json.array! @handover_form_items do |handover_form_item|
    json.partial! 'office_handover_form_items/handover_form_item', handover_form_item: handover_form_item
    json.url  "
              #{link_to 'Show', handover_form_item }
              #{link_to 'Edit', edit_handover_form_item_path(handover_form_item)}
              #{link_to 'Destroy', handover_form_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end