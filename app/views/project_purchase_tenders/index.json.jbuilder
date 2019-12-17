json.set! :data do
  json.array! @project_purchase_tenders do |project_purchase_tender|
    json.partial! 'project_purchase_tenders/project_purchase_tender', project_purchase_tender: project_purchase_tender
    json.url  "
              #{link_to 'Show', project_purchase_tender }
              #{link_to 'Edit', edit_project_purchase_tender_path(project_purchase_tender)}
              #{link_to 'Destroy', project_purchase_tender, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end