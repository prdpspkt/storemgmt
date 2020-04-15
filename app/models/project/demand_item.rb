class Project::DemandItem < ApplicationRecord
  belongs_to :demand, class_name: "Project::Demand"
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :project, class_name: "Project::Project"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
end
