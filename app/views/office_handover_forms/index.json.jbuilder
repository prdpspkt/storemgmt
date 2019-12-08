json.set! :data do
  json.array! @handover_forms do |handover_form|
    json.partial! 'handover_forms/handover_form', handover_form: handover_form
    json.url  "
              #{link_to 'Show', handover_form }
              #{link_to 'Edit', edit_handover_form_path(handover_form)}
              #{link_to 'Destroy', handover_form, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end