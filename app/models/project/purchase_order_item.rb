class Project::PurchaseOrderItem < ApplicationRecord
  self.table_name = "project_purchase_order_items"
  belongs_to :purchase_order, class_name: "Project::PurchaseOrder"
  belongs_to :item, class_name: "Project::Item"
end
