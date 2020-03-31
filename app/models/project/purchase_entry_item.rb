class Project::PurchaseEntryItem < ApplicationRecord
  belongs_to :purchase_entry, class_name: "Project::PurchaseEntry"
  belongs_to :item, :class_name => 'Project::Item'
end
