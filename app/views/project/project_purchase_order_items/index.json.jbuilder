json.set! :data do
  json.array! @project_purchase_order_items do |project_purchase_order_item|
    json.partial! 'project_purchase_order_items/project_purchase_order_item', project_purchase_order_item: project_purchase_order_item
    json.url  "
              #{link_to 'Show', project_purchase_order_item }
              #{link_to 'Edit', edit_project_purchase_order_item_path(project_purchase_order_item)}
              #{link_to 'Destroy', project_purchase_order_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end