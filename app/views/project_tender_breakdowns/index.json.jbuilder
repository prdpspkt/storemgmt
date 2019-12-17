json.set! :data do
  json.array! @project_tender_breakdowns do |project_tender_breakdown|
    json.partial! 'project_tender_breakdowns/project_tender_breakdown', project_tender_breakdown: project_tender_breakdown
    json.url  "
              #{link_to 'Show', project_tender_breakdown }
              #{link_to 'Edit', edit_project_tender_breakdown_path(project_tender_breakdown)}
              #{link_to 'Destroy', project_tender_breakdown, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end