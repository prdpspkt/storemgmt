json.set! :data do
  json.array! @project_tender_breakdowns do |project_tender_breakdown|
    json.partial! 'project_tender_breakdowns/project_tender_breakdown', project_tender_breakdown: project_tender_breakdown
    json.project_name_en "#{ project_tender_breakdown.project.name_of_project_en}"
    json.project_purchase_entry_no "#{ nd project_tender_breakdown.project_purchase_entry.entry_no}"
    json.project_purchase_entry_date "#{ ndate project_tender_breakdown.project_purchase_entry.entry_date}"
    if (can_unmark(project_tender_breakdown))
      json.url "
               #{link_to show_btn.html_safe, project_tender_breakdown }
               #{link_to edit_btn.html_safe, edit_project_tender_breakdown_path(project_tender_breakdown)}
               #{link_to destroy_btn.html_safe, project_tender_breakdown, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    else
      json.url "#{link_to show_btn.html_safe, project_tender_breakdown }"
    end
  end
end