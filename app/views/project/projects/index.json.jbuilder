json.set! :data do
  json.array! @projects do |project|
    json.partial! 'project/projects/project', project: project
    if project.project_items.count > 0
      json.url "
               #{link_to show_btn.html_safe, project }
               #{link_to edit_btn.html_safe, edit_project_project_path(project)}
               "
    else
      json.url "
               #{link_to show_btn.html_safe, project }
               #{link_to edit_btn.html_safe, edit_project_project_path(project)}
               #{link_to destroy_btn.html_safe, project, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    end
  end
end