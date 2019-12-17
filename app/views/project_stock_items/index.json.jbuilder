json.set! :data do
  json.array! @project_stock_items do |project_stock_item|
    json.partial! 'project_stock_items/project_stock_item', project_stock_item: project_stock_item
    json.url  "
              #{link_to 'Show', project_stock_item }
              #{link_to 'Edit', edit_project_stock_item_path(project_stock_item)}
              #{link_to 'Destroy', project_stock_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end