json.set! :data do
	@sn = 1
  json.array! @item_categories do |item_category|
  	json.sn "{@sn}"
    json.partial! 'project/item_categories/item_category', item_category: item_category
    json.url "
             #{link_to show_btn.html_safe, project_item_category_path(item_category)}
             #{link_to edit_btn.html_safe, edit_project_item_category_path(item_category)}
             #{link_to destroy_btn.html_safe, item_category, method: :delete, data: {confirm: 'Are you sure?'}}
             "
  @sn = @sn + 1
  end
end