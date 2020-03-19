json.set! :data do
  json.array! @office_release_items do |office_release_item|
    json.partial! 'office_release_items/office_release_item', office_release_item: office_release_item
    json.url  "
              #{link_to 'Show', office_release_item }
              #{link_to 'Edit', edit_office_release_item_path(office_release_item)}
              #{link_to 'Destroy', office_release_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end