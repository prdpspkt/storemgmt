json.extract! project_purchase_tender, :tender_no, :tender_name, :tender_date, :marked_as_final, :bidders_name, :bidders_address, :created_at, :updated_at
json.url project_tender_url(project_purchase_tender, format: :json)
