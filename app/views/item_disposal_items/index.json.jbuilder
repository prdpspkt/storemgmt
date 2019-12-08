json.set! :data do
  json.array! @item_disposal_items do |item_disposal_item|
    json.partial! 'item_disposal_items/item_disposal_item', item_disposal_item: item_disposal_item
    json.url  "
              #{link_to 'Show', item_disposal_item }
              #{link_to 'Edit', edit_item_disposal_item_path(item_disposal_item)}
              #{link_to 'Destroy', item_disposal_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end