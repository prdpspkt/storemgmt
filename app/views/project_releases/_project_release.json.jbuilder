json.extract! project_release, :id, :fy, :release_no, :release_date, :store_chief_name, :store_chief_signed_date, :office_chief_name, :office_chief_signed_date, :user_id, :office_id, :project_id, :fiscal_year_id, :marked_as_final, :created_at, :updated_at
json.url project_release_url(project_release, format: :json)
