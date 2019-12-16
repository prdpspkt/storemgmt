json.extract! project_demand, :id, :demand_no, :demand_date, :demand_by, :recommended_by, :needed_to_purchase, :ordered_by, :ordered_date, :recorded_by, :recorded_date, :user_id, :fiscal_year_id, :office_id, :project_id, :item_id, :marked_as_final, :created_at, :updated_at
json.url project_demand_url(project_demand, format: :json)
