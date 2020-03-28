class Project::DemandItem < ApplicationRecord
  self.table_name = "project_demand_items"
  belongs_to :demand, class_name: "Project::Demand"
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :project, class_name: "Project::Project"
end
