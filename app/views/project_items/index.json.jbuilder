json.set! :data do
  json.array! @project_items do |item|
    json.item_category "
                       #{ProjectItemCategory.find(item.project_item_category_id).name_ne}
                       "
    json.partial! 'items/item', item: item
    json.url "
             #{link_to edit_btn.html_safe, edit_item_path(item)}
             #{link_to destroy_btn.html_safe, item, method: :delete, data: {confirm: 'Are you sure?'}}
             "
  end
end