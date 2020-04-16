json.set! :data do
  json.array! @project_tender_items do |project_tender_item|
    json.partial! 'project_tender_items/project_tender_item', project_tender_item: project_tender_item
    json.url "
             #{link_to 'Show', project_tender_item }
             #{link_to 'Edit', edit_project_tender_item_path(project_tender_item)}
             #{link_to 'Destroy', project_tender_item, method: :delete, data: {confirm: 'Are you sure?'}}
             "
  end
end