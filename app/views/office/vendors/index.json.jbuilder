json.set! :data do
  json.array! @vendors do |vendor|
    json.partial! 'office/vendors/vendor', vendor: vendor
    json.url  "
              #{link_to edit_btn.html_safe, edit_office_vendor_path(vendor)}
              #{link_to destroy_btn.html_safe, vendor, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end