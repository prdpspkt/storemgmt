@serial = 1
json.set! :data do
  json.array! @office_purchase_entries do |office_entry|
    json.partial! 'office_purchase_entries/office_purchase_entry', office_purchase_entry: office_entry
    json.url  "
              #{link_to show_btn.html_safe, office_entry }
              #{link_to destroy_btn.html_safe, office_entry, data:{method: :delete, confirm: "Are you sure ?"}}
              "
    json.serial "
              #{@serial}
                "
    json.entry_date "#{ ndate office_entry.entry_date}"
    json.entry_no "#{ nd office_entry.entry_no}"
    @serial = @serial + 1
  end
end