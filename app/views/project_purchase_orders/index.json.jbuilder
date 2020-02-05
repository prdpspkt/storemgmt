json.set! :data do
  @i = 1
  json.array! @project_purchase_orders do |project_purchase_order|
    json.partial! 'project_purchase_orders/project_purchase_order', project_purchase_order: project_purchase_order
    if project_purchase_order.marked_as_final != true
      json.url "
               #{link_to show_btn.html_safe, project_purchase_order }
               #{link_to edit_btn.html_safe, edit_project_purchase_order_path(project_purchase_order)}
               #{link_to destroy_btn.html_safe, project_purchase_order, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    else
      json.url "
               #{link_to show_bth.html_safe, project_purchase_order }
               "
    end
    json.sn "#{nd @i}"
    json.order_no "#{nd project_purchase_order.order_no}"
    json.order_date "#{ndate project_purchase_order.order_date}"
    @i = @i + 1
  end

end