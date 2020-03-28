class Project::ProjectItem < ApplicationRecord
  self.table_name = "project_project_items"
  belongs_to :project, class_name: "Project::Project"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :item, :class_name => 'Project::Item'
  has_many :project_item_transactions, :class_name => 'Project::ProjectItemTransaction'

end