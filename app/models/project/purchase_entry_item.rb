class Project::PurchaseEntryItem < ApplicationRecord
  self.table_name = "project_purchase_entry_items"
  belongs_to :purchase_entry, class_name: "Project::PurchaseEntry"
  belongs_to :item, :class_name => 'Project::Item'
end
