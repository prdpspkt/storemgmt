class Project::PurchaseOrder < ApplicationRecord
  self.table_name = "project_purchase_orders"
  has_many :purchase_order_items, dependent: :destroy, class_name: "Project::PurchaseOrderItem"
  has_one :project_purchase_entry, class_name: "Project::PurchaseEntry
"
end
