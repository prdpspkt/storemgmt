json.set! :data do
  json.array! @items do |item|
    json.item_category "
                       #{Office::ItemCategory.find(item.item_category_id).name_ne}
                       "
    json.partial! 'office/items/item', item: item
    json.url "
             #{link_to edit_btn.html_safe, edit_office_item_path(item)}
             #{link_to destroy_btn.html_safe, item, method: :delete, data: {confirm: 'Are you sure?'}}
             "
  end
end