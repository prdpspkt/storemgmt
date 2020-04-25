json.set! :data do
  json.array! @items do |item|
    json.item_category "
                       #{item.item_category.name_ne}
                       "
    json.partial! 'office/items/item', item: item
    json.unit_ne "#{item.item_category.unit_ne}"
    json.item_classification_no "#{nd item.item_classification_no}"
    json.url "
             #{link_to show_btn.html_safe, item_register_office_item_url(item)}
             "
  end
end