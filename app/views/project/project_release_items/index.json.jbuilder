json.set! :data do
  json.array! @project_release_items do |project_release_item|
    json.partial! 'project_release_items/project_release_item', project_release_item: project_release_item
    json.url  "
              #{link_to 'Show', project_release_item }
              #{link_to 'Edit', edit_project_release_item_path(project_release_item)}
              #{link_to 'Destroy', project_release_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end