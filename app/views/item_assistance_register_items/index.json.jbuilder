json.set! :data do
  json.array! @item_assistance_register_items do |item_assistance_register_item|
    json.partial! 'item_assistance_register_items/item_assistance_register_item', item_assistance_register_item: item_assistance_register_item
    json.url  "
              #{link_to 'Show', item_assistance_register_item }
              #{link_to 'Edit', edit_item_assistance_register_item_path(item_assistance_register_item)}
              #{link_to 'Destroy', item_assistance_register_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end