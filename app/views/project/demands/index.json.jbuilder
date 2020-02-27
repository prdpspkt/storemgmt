json.set! :data do
  json.array! @project_demands do |project_demand|
    json.partial! 'project_demands/project_demand', project_demand: project_demand
    json.demand_no "#{ nd project_demand.demand_no}"
    json.demand_date "#{ ndate project_demand.demand_date}"
    if project_demand.marked_as_final != true
    json.url  "
              #{link_to show_btn.html_safe, project_demand }
              #{link_to edit_btn.html_safe, edit_project_demand_path(project_demand)}
              #{link_to destroy_btn.html_safe, project_demand, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    else
      json.url  "
                #{link_to show_btn.html_safe, project_demand }
                "
    end
  end
end