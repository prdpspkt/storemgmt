json.set! :data do
  json.array! @project_handover_form_items do |project_handover_form_item|
    json.partial! 'project_handover_form_items/project_handover_form_item', project_handover_form_item: project_handover_form_item
    json.url  "
              #{link_to 'Show', project_handover_form_item }
              #{link_to 'Edit', edit_project_handover_form_item_path(project_handover_form_item)}
              #{link_to 'Destroy', project_handover_form_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end