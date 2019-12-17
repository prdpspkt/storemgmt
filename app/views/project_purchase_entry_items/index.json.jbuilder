json.set! :data do
  json.array! @project_purchase_entry_items do |project_purchase_entry_item|
    json.partial! 'project_purchase_entry_items/project_purchase_entry_item', project_purchase_entry_item: project_purchase_entry_item
    json.url  "
              #{link_to 'Show', project_purchase_entry_item }
              #{link_to 'Edit', edit_project_purchase_entry_item_path(project_purchase_entry_item)}
              #{link_to 'Destroy', project_purchase_entry_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end