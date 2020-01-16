json.set! :data do
  json.array! @project_purchase_entries do |project_purchase_entry|
    json.partial! 'project_purchase_entries/project_purchase_entry', project_purchase_entry: project_purchase_entry
    json.entry_date "#{ndate project_purchase_entry.entry_date}"
    json.entry_no "#{nd project_purchase_entry.entry_no}"
    if project_purchase_entry.marked_as_final == true
      json.url  "
                #{link_to show_btn.html_safe, project_purchase_entry }
               "
    else
      json.url  "
                #{link_to show_btn.html_safe, project_purchase_entry }
                #{link_to edit_btn.html_safe, edit_project_purchase_entry_path(project_purchase_entry)}
                #{link_to destroy_btn.html_safe, project_purchase_entry, method: :delete, data: { confirm: 'Are you sure?' }}
                "
    end

  end
end