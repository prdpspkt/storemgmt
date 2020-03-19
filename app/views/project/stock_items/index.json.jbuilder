json.set! :data do
  json.array! @office_stock_items do |office_stock_item|
    json.partial! 'office_stock_items/office_stock_item', office_stock_item: office_stock_item
    json.url  "
              #{link_to 'Show', office_stock_item }
              #{link_to 'Edit', edit_office_stock_item_path(office_stock_item)}
              #{link_to 'Destroy', office_stock_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end