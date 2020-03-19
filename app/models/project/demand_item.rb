class Project::DemandItem < ApplicationRecord
  self.table_name = "project_demands"
  belongs_to :demand, class_name: "Project::Demand"
end
