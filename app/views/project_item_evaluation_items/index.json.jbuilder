json.set! :data do
  json.array! @office_item_evaluation_items do |office_item_evaluation_item|
    json.partial! 'project_item_evaluation_items/office_item_evaluation_item', office_item_evaluation_item: office_item_evaluation_item
    json.url  "
              #{link_to 'Show', office_item_evaluation_item }
              #{link_to 'Edit', edit_project_item_evaluation_item_path(office_item_evaluation_item)}
              #{link_to 'Destroy', office_item_evaluation_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end