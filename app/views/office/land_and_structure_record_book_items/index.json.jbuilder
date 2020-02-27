json.set! :data do
  json.array! @land_and_structure_record_book_items do |land_and_structure_record_book_item|
    json.partial! 'land_and_structure_record_book_items/land_and_structure_record_book_item', land_and_structure_record_book_item: land_and_structure_record_book_item
    json.url  "
              #{link_to 'Show', land_and_structure_record_book_item }
              #{link_to 'Edit', edit_land_and_structure_record_book_item_path(land_and_structure_record_book_item)}
              #{link_to 'Destroy', land_and_structure_record_book_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end