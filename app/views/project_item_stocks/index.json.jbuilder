json.set! :data do
  json.array! @project_item_stocks do |project_item_stock|
    json.partial! 'project_item_stocks/project_item_stock', project_item_stock: project_item_stock
    json.url  "
              #{link_to 'Show', project_item_stock }
              #{link_to 'Edit', edit_project_item_stock_path(project_item_stock)}
              #{link_to 'Destroy', project_item_stock, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end