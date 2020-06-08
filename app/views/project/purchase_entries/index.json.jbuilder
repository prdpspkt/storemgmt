@serial = 1
json.set! :data do
  json.array! @purchase_entries do |project_entry|
    json.partial! '/project/purchase_entries/purchase_entry', project_purchase_entry: project_entry
    if project_entry.marked_as_final != true
      json.url "
               #{link_to show_btn.html_safe, project_entry }
               #{link_to edit_btn.html_safe, edit_project_purchase_entry_path(project_entry) }
               #{link_to destroy_btn.html_safe, project_entry, data: {method: :delete, confirm: "Are you sure ?"}}"
    else
      json.url "
               #{link_to show_btn.html_safe, project_entry}
               "
    end
    json.serial "
                #{  @serial}
                "
    json.entry_date "#{ ndate project_entry.entry_date}"
    json.entry_no "#{ nd project_entry.entry_no}"
    @serial = @serial + 1
  end
end