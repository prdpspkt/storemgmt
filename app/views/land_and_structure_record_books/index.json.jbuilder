json.set! :data do
  json.array! @land_and_structure_record_books do |land_and_structure_record_book|
    json.partial! 'land_and_structure_record_books/land_and_structure_record_book', land_and_structure_record_book: land_and_structure_record_book
    json.url  "
              #{link_to 'Show', land_and_structure_record_book }
              #{link_to 'Edit', edit_land_and_structure_record_book_path(land_and_structure_record_book)}
              #{link_to 'Destroy', land_and_structure_record_book, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end