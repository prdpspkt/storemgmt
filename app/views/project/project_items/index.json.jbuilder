json.set! :data do
  json.array! @office_items do |office_item|
    json.partial! 'office_items/office_item', office_item: office_item
    json.url  "
              #{link_to edit_btn.html_safe, edit_office_item_path(office_item)}
              #{link_to destroy_btn.html_safe, office_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end