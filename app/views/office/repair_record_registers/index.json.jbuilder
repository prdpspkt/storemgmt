json.set! :data do
  json.array! @repair_record_registers do |repair_record_register|
    json.partial! 'office/repair_record_registers/repair_record_register', repair_record_register: repair_record_register
    json.url  "
              #{link_to show_btn.html_safe, repair_record_register }
              #{link_to edit_btn.html_safe, edit_office_repair_record_register_path(repair_record_register)}
              #{link_to destroy_btn.html_safe, repair_record_register, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    json.name_of_item_ne "
                          #{ repair_record_register.item.name_of_item_ne}
                         "
    json.fy "
    #{repair_record_register.fiscal_year.fy}
            "

  end
end