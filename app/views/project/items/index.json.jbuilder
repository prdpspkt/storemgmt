json.set! :data do
  json.array! @items do |item|
    json.item_category "
                       #{item.item_category.name_ne}
                       "
    json.partial! 'project/items/item', item: item
    json.unit_ne "#{item.item_category.unit_ne}"
    json.item_classification_no "#{nd item.item_classification_no}"
    json.item_register_page_no "#{nd item.item_register_page_no}"
    if item.project_item_transactions.count > 0
    json.url "
             #{link_to edit_btn.html_safe, edit_project_item_path(item)}
             "
    else
      json.url "
               #{link_to edit_btn.html_safe, edit_project_item_path(item)}
               #{link_to destroy_btn.html_safe, item, method: :delete, data: {confirm: 'Are you sure?'}}
               "
      end
  end
end