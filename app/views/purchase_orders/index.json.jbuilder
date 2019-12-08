json.set! :data do
  json.array! @purchase_orders do |purchase_order|
    json.partial! 'purchase_orders/purchase_order', purchase_order: purchase_order
    json.url  "
              #{link_to show_btn.html_safe, purchase_order }
              #{link_to edit_btn.html_safe, edit_purchase_order_path(purchase_order)}
              #{link_to destroy_btn.html_safe, purchase_order, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end