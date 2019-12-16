json.extract! project_evaluation, :id, :fy, :committee_formation_date, :report_submission_date, :office_id, :user_id, :fiscal_year_id, :marked_as_final, :created_at, :updated_at
json.url project_evaluation_url(project_evaluation, format: :json)
