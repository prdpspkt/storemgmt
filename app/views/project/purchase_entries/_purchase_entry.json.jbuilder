json.extract! project_purchase_entry, :id, :entry_date, :entry_no, :store_chief_signed_date, :section_chief_signed_date, :office_chief_signed_date
json.url project_purchase_entries_url(project_purchase_entry, format: :json)
