json.set! :data do
  json.array! @repair_record_registers do |repair_record_register|
    json.partial! 'repair_record_registers/repair_record_register', repair_record_register: repair_record_register
    json.url  "
              #{link_to 'Show', repair_record_register }
              #{link_to 'Edit', edit_repair_record_register_path(repair_record_register)}
              #{link_to 'Destroy', repair_record_register, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end