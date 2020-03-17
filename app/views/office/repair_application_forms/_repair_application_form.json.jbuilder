json.extract! repair_application_form, :id, :application_no, :date, :vendor_name,  :within_date
json.url office_repair_application_form_url(repair_application_form, format: :json)
