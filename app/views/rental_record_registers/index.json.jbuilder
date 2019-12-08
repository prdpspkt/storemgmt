json.set! :data do
  json.array! @rental_record_registers do |rental_record_register|
    json.partial! 'rental_record_registers/rental_record_register', rental_record_register: rental_record_register
    json.url  "
              #{link_to 'Show', rental_record_register }
              #{link_to 'Edit', edit_rental_record_register_path(rental_record_register)}
              #{link_to 'Destroy', rental_record_register, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end