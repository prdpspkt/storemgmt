class Project::Demand < ApplicationRecord
  self.table_name = "project_demands"
  belongs_to :project
  has_many :demand_items, class_name: "Project::DemandItem"
end
