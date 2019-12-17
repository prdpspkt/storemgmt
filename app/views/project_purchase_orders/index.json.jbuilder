json.set! :data do
  json.array! @project_purchase_orders do |project_purchase_order|
    json.partial! 'project_purchase_orders/project_purchase_order', project_purchase_order: project_purchase_order
    json.url  "
              #{link_to 'Show', project_purchase_order }
              #{link_to 'Edit', edit_project_purchase_order_path(project_purchase_order)}
              #{link_to 'Destroy', project_purchase_order, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end