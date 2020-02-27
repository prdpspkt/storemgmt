json.set! :data do
  json.array! @item_categories do |item_category|
    json.partial! 'office/item_categories/item_category', item_category: item_category
    json.url  "
              #{link_to edit_btn.html_safe, edit_office_item_category_path(item_category)}
              #{link_to destroy_btn.html_safe, item_category, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end