json.set! :data do
  json.array! @project_tenders do |project_tender|
    json.partial! 'project_tenders/project_tender', project_tender: project_tender
    json.tender_no "#{ nd project_tender.tender_no}"
    json.tender_date "#{ ndate project_tender.tender_date}"
    if project_tender.marked_as_final != true
    json.url  "
              #{link_to show_btn.html_safe, project_tender }
              #{link_to edit_btn.html_safe, edit_project_tender_path(project_tender)}
              #{link_to destroy_btn.html_safe, project_tender, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    else
      json.url  "
                #{link_to show_btn.html_safe,project_tender }
                "
    end
  end
end