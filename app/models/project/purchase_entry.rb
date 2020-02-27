class Project::PurchaseEntry < ApplicationRecord
  has_many :purchase_entry_items, class_name: "Project::PurchaseEntryItem", dependent: :delete_all
end
