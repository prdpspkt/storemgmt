class Project::Demand < ApplicationRecord
  belongs_to :project
  has_many :demand_items, class_name: "Project::DemandItem"
end
