json.set! :data do
  json.array! @project_evaluations do |project_evaluation|
    json.partial! 'project_evaluations/project_evaluation', project_evaluation: project_evaluation
    json.url  "
              #{link_to 'Show', project_evaluation }
              #{link_to 'Edit', edit_project_evaluation_path(project_evaluation)}
              #{link_to 'Destroy', project_evaluation, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end