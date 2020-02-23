class Project::ProjectBasedItem < ApplicationRecord
  self.table_name = "project_based_items"
  belongs_to :project
end