json.set! :data do
  json.array! @project_stocks do |project_stock|
    json.partial! 'project_stocks/project_stock', project_stock: project_stock
    json.url  "
              #{link_to 'Show', project_stock }
              #{link_to 'Edit', edit_project_stock_path(project_stock)}
              #{link_to 'Destroy', project_stock, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end