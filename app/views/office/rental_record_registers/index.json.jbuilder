json.set! :data do
  @sn = 1
  json.array! @rental_record_registers do |rental_record_register|
    json.partial! 'office/rental_record_registers/rental_record_register', rental_record_register: rental_record_register
    json.url  "
              #{link_to show_btn.html_safe, rental_record_register }
              #{link_to edit_btn.html_safe, edit_office_rental_record_register_path(rental_record_register)}
              #{link_to destroy_btn.html_safe, rental_record_register, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    json.sn "#{@sn}"
    json.name_of_item_ne "#{ rental_record_register.item.name_of_item_ne}"
    @sn = @sn + 1
  end
end