json.set! :data do
  json.array! @project_evaluation_items do |project_evaluation_item|
    json.partial! 'project_evaluation_items/project_evaluation_item', project_evaluation_item: project_evaluation_item
    json.url  "
              #{link_to 'Show', project_evaluation_item }
              #{link_to 'Edit', edit_project_evaluation_item_path(project_evaluation_item)}
              #{link_to 'Destroy', project_evaluation_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end