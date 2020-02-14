json.set! :data do
  json.array! @project_items do |project_item|
    json.partial! 'project_items/project_item', project_item: project_item
    json.url  "
              #{link_to show_btn.html_safe, pits_report_path(project_item) }
              #{link_to edit_btn.html_safe, edit_project_item_path(project_item)}
              #{link_to destroy_btn.html_safe, project_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    json.item_register_page_no "#{nd project_item.item_register_page_no}"
    json.item_classification_no "#{ nd project_item.item_classification_no}"
  end
end