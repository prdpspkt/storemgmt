class Project::PurchaseEntryItem < ApplicationRecord
  belongs_to :purchase_entry, class_name: "Project::PurchaseEntry"
end
