class Project::Demand < ApplicationRecord
  belongs_to :project, class_name: "Project::Project"
  has_many :demand_items, class_name: "Project::DemandItem"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :store_body, :class_name => 'Office::StoreBody'
end
