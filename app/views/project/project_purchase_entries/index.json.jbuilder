@serial = 1
json.set! :data do
  json.array! @purchase_entries do |project_entry|
    json.partial! '/project/project_purchase_entries/purchase_entry', project_purchase_entry: project_entry
    json.project_name_ne "#{project_entry.project.name_of_project_ne}"
    json.project_name_en "#{project_entry.project.name_of_project_en}"
    purchase_entry = project_entry.purchase_entry
    tender = purchase_entry.tender
    purchase_order = purchase_entry.purchase_order
    json.form_no  ""
    json.purchase_entry_no "#{nd purchase_entry.entry_no}"
    unless tender.blank?
      json.form_no "टे.नं.#{nd tender.tender_no}" 
    end

    unless purchase_order.blank?
      json.form_no "ख.आ.#{nd purchase_order.order_no}"
    end

    if project_entry.accepted != true
      json.url "
               #{link_to show_btn.html_safe, project_entry }
               #{link_to edit_btn.html_safe, edit_project_project_purchase_entry_path(project_entry) }
               #{link_to destroy_btn.html_safe, project_entry, data: {method: :delete, confirm: "Are you sure ?"}}"
    else
      json.url "
               #{link_to show_btn.html_safe, project_entry}
               "
    end
    json.serial "
                #{@serial}
                "
    json.entry_date "#{ ndate project_entry.entry_date}"
    json.entry_no "#{ nd project_entry.entry_no}"
    @serial = @serial + 1
  end
end