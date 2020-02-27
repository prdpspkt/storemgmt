@serial = 1
json.set! :data do
  json.array! @office_purchase_entries do |office_entry|
    json.partial! 'office_purchase_entries/office_purchase_entry', office_purchase_entry: office_entry
    if office_entry.marked_as_final != true
      json.url "
               #{link_to show_btn.html_safe, office_entry }
               #{link_to edit_btn.html_safe, edit_office_purchase_entry_path(office_entry) }
               #{link_to destroy_btn.html_safe, office_entry, data: {method: :delete, confirm: "Are you sure ?"}}"
    else
      json.url "
                #{link_to show_btn.html_safe, office_entry}
               "
    end
    json.serial "
                #{ nd @serial}
                "
    json.entry_date "#{ ndate office_entry.entry_date}"
    json.entry_no "#{ nd office_entry.entry_no}"
    @serial = @serial + 1
  end
end