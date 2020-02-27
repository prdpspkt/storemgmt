json.set! :data do
  json.array! @project_demand_items do |project_demand_item|
    json.partial! 'project_demand_items/project_demand_item', project_demand_item: project_demand_item
    json.url  "
              #{link_to 'Show', project_demand_item }
              #{link_to 'Edit', edit_project_demand_item_path(project_demand_item)}
              #{link_to 'Destroy', project_demand_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end