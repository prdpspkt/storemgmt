json.extract! handover_form, :id, :decision_date, :fy, :decision_no, :handovered_office_name, :date, :form_no
json.url office_handover_form_url(handover_form, format: :json)
