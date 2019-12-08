json.set! :data do
  json.array! @purchase_order_items do |purchase_order_item|
    json.partial! 'purchase_order_items/purchase_order_item', purchase_order_item: purchase_order_item
    json.url  "
              #{link_to 'Show', purchase_order_item }
              #{link_to 'Edit', edit_purchase_order_item_path(purchase_order_item)}
              #{link_to 'Destroy', purchase_order_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end