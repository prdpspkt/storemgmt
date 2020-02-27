json.set! :data do
  json.array! @item_disposals do |item_disposal|
    json.partial! 'item_disposals/item_disposal', item_disposal: item_disposal
    json.url  "
              #{link_to 'Show', item_disposal }
              #{link_to 'Edit', edit_item_disposal_path(item_disposal)}
              #{link_to 'Destroy', item_disposal, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end