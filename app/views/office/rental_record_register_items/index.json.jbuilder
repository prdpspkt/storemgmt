json.set! :data do
  json.array! @rental_record_register_items do |rental_record_register_item|
    json.partial! 'rental_record_register_items/rental_record_register_item', rental_record_register_item: rental_record_register_item
    json.url  "
              #{link_to 'Show', rental_record_register_item }
              #{link_to 'Edit', edit_rental_record_register_item_path(rental_record_register_item)}
              #{link_to 'Destroy', rental_record_register_item, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end