json.set! :data do
  json.array! @project_purchase_tenders do |project_purchase_tender|
    json.partial! 'project_tenders/project_purchase_tender', project_purchase_tender: project_purchase_tender
    json.tender_no "#{ nd project_purchase_tender.tender_no}"
    json.tender_date "#{ ndate project_purchase_tender.tender_date}"
    if project_purchase_tender.marked_as_final != true
    json.url  "
              #{link_to show_btn.html_safe, project_purchase_tender }
              #{link_to edit_btn.html_safe, edit_project_tender_path(project_purchase_tender)}
              #{link_to destroy_btn.html_safe, project_purchase_tender, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    else
      json.url  "
                #{link_to show_btn.html_safe, project_purchase_tender }
                "
    end
  end
end