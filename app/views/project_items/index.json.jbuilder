json.set! :data do
  json.array! @project_items do |project_item|
    json.partial! 'project_items/project_item', project_item: project_item
    json.url  "
              #{link_to 'Show', project_item }
              #{link_to 'Edit', edit_project_item_path(project_item)}
              #{link_to 'Destroy', project_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end