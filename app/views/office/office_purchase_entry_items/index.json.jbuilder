json.set! :data do
  json.array! @office_purchase_entry_items do |office_purchase_entry_item|
    json.partial! 'office_purchase_entry_items/office_purchase_entry_item', office_purchase_entry_item: office_purchase_entry_item
    json.url  "
              #{link_to 'Show', office_purchase_entry_item }
              #{link_to 'Edit', edit_office_purchase_entry_item_path(office_purchase_entry_item)}
              #{link_to 'Destroy', office_purchase_entry_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end