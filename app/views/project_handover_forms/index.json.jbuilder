json.set! :data do
  json.array! @project_handover_forms do |project_handover_form|
    json.partial! 'project_handover_forms/project_handover_form', project_handover_form: project_handover_form
    json.url  "
              #{link_to 'Show', project_handover_form }
              #{link_to 'Edit', edit_project_handover_form_path(project_handover_form)}
              #{link_to 'Destroy', project_handover_form, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end