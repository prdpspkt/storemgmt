json.set! :data do
  json.array! @handover_forms do |handover_form|
    json.partial! 'office/handover_forms/handover_form', handover_form: handover_form
    json.date "#{ ndate handover_form.date}"
    json.form_no nd handover_form.form_no
    if handover_form.marked_as_final != true
      json.url "
               #{link_to show_btn.html_safe, handover_form }
               #{link_to edit_btn.html_safe, edit_office_handover_form_path(handover_form)}
               #{link_to destroy_btn.html_safe, handover_form, method: :delete, data: {confirm: 'Are you sure?'}}
               "
    else
      json.url "
               #{link_to show_btn.html_safe, handover_form }
               "
    end
  end
end