json.set! :data do
  json.array! @office_stocks do |office_stock|
    json.partial! 'office_stocks/office_stock', office_stock: office_stock
    json.url  "
              #{link_to 'Show', office_stock }
              #{link_to 'Edit', edit_office_stock_path(office_stock)}
              #{link_to 'Destroy', office_stock, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end