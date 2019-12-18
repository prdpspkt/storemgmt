json.set! :data do
  json.array! @repair_application_forms do |repair_application_form|
    json.partial! 'repair_application_forms/repair_application_form', repair_application_form: repair_application_form
    json.url  "
              #{link_to show_btn.html_safe, repair_application_form }
              #{link_to edit_btn.html_safe, edit_repair_application_form_path(repair_application_form)}
              #{link_to destroy_btn.html_safe, repair_application_form, method: :delete, data: { confirm: 'Are you sure?' }}
              "
    json.application_no "#{ nd repair_application_form.application_no}"
    json.date "#{ ndate repair_application_form.date}"
  end
end