json.set! :data do
  json.array! @item_assistance_registers do |item_assistance_register|
    json.partial! 'item_assistance_registers/item_assistance_register', item_assistance_register: item_assistance_register
    json.url  "
              #{link_to show_btn.html_safe, item_assistance_register }
              #{link_to edit_btn.html_safe, edit_item_assistance_register_path(item_assistance_register)}
              #{link_to destroy_btn.html_safe, item_assistance_register, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end