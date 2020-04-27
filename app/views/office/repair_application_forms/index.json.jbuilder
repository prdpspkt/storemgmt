json.set! :data do
  json.array! @repair_application_forms do |repair_application_form|
    json.partial! 'office/repair_application_forms/repair_application_form', repair_application_form: repair_application_form
    unless repair_application_form.accepted == true
      json.url "
               #{link_to show_btn.html_safe, repair_application_form }
               #{link_to edit_btn.html_safe, edit_office_repair_application_form_path(repair_application_form)}
               #{link_to destroy_btn.html_safe, repair_application_form, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    else
      json.url "#{link_to show_btn.html_safe, repair_application_form }"
    end
    json.application_no "#{ nd repair_application_form.application_no}"
    json.date "#{ ndate repair_application_form.date}"
    json.vendor_name "#{ repair_application_form.vendor.vendor_name}"
    json.within_date "#{ndate repair_application_form.within_date}"
  end
end