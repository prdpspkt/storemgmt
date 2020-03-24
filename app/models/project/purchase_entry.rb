class Project::PurchaseEntry < ApplicationRecord
  self.table_name = "project_purchase_entries"
  has_many :purchase_entry_items, class_name: "Project::PurchaseEntryItem", dependent: :delete_all
  belongs_to :purchase_order, :class_name => 'Office::PurchaseOrder', optional: true
  belongs_to :store_body, :class_name => 'Office::StoreBody'
end
