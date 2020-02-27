json.set! :data do
  json.array! @project_tender_breakdown_items do |project_tender_breakdown_item|
    json.partial! 'project_tender_breakdown_items/project_tender_breakdown_item', project_tender_breakdown_item: project_tender_breakdown_item
    json.url  "
              #{link_to 'Show', project_tender_breakdown_item }
              #{link_to 'Edit', edit_project_tender_breakdown_item_path(project_tender_breakdown_item)}
              #{link_to 'Destroy', project_tender_breakdown_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end