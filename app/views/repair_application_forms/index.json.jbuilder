json.set! :data do
  json.array! @repair_application_forms do |repair_application_form|
    json.partial! 'repair_application_forms/repair_application_form', repair_application_form: repair_application_form
    json.url  "
              #{link_to 'Show', repair_application_form }
              #{link_to 'Edit', edit_repair_application_form_path(repair_application_form)}
              #{link_to 'Destroy', repair_application_form, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end