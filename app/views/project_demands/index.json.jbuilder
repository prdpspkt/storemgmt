json.set! :data do
  json.array! @project_demands do |project_demand|
    json.partial! 'project_demands/project_demand', project_demand: project_demand
    json.url  "
              #{link_to 'Show', project_demand }
              #{link_to 'Edit', edit_project_demand_path(project_demand)}
              #{link_to 'Destroy', project_demand, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end