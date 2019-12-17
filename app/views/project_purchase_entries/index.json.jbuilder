json.set! :data do
  json.array! @project_purchase_entries do |project_purchase_entry|
    json.partial! 'project_purchase_entries/project_purchase_entry', project_purchase_entry: project_purchase_entry
    json.url  "
              #{link_to 'Show', project_purchase_entry }
              #{link_to 'Edit', edit_project_purchase_entry_path(project_purchase_entry)}
              #{link_to 'Destroy', project_purchase_entry, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end