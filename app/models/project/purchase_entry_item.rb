class Project::PurchaseEntryItem < ApplicationRecord
  belongs_to :purchase_entry, class_name: "Project::PurchaseEntry"
  belongs_to :item, :class_name => 'Project::Item'
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
end
