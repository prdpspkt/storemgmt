class Project::ProjectPurchaseEntryItem < ApplicationRecord
  self.table_name = "project_project_purchase_entry_items"
  belongs_to :project_purchase_entry, :class_name => 'Project::ProjectPurchaseEntry'
  belongs_to :item, class_name: "Project::Item"
end
