json.set! :data do
  json.array! @item_categories do |item_category|
    json.partial! 'office/item_categories/item_category', item_category: item_category
    if item_category.items.count > 0
      json.url  "
                #{link_to show_btn.html_safe, office_item_category_path(item_category)}
                #{link_to edit_btn.html_safe, edit_office_item_category_path(item_category)}
                "
    else
      json.url  "
                #{link_to show_btn.html_safe, office_item_category_path(item_category)}
                #{link_to edit_btn.html_safe, edit_office_item_category_path(item_category)}
                #{link_to destroy_btn.html_safe, item_category, method: :delete, data: { confirm: 'Are you sure?' }}
                "
    end

    json.id "
            #{nd item_category.id}
            "
  end
end