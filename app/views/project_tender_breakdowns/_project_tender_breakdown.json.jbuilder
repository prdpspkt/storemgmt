json.extract! project_tender_breakdown, :id, :office_id, :user_id, :project_tender_id, :project_id, :project_name_en, :project_name_ne, :marked_as_final, :created_at, :updated_at
json.url project_tender_breakdown_url(project_tender_breakdown, format: :json)
