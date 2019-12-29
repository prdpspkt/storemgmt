json.set! :data do
  json.array! @project_tender_breakdowns do |project_tender_breakdown|
    json.partial! 'project_tender_breakdowns/project_tender_breakdown', project_tender_breakdown: project_tender_breakdown
    json.project_name_en "#{ project_tender_breakdown.project.name_of_project_en}"
    json.project_tender_name "#{ project_tender_breakdown.project_purchase_tender.tender_name}"
    json.project_tender_no "#{project_tender_breakdown.project_purchase_tender.tender_no}"
    json.url  "
              #{link_to 'Show', project_tender_breakdown }
              #{link_to 'Edit', edit_project_tender_breakdown_path(project_tender_breakdown)}
              #{link_to 'Destroy', project_tender_breakdown, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end