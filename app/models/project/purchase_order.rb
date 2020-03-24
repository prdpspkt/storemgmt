class Project::PurchaseOrder < ApplicationRecord
  self.table_name = "project_purchase_orders"
  has_many :purchase_order_items, dependent: :destroy, class_name: "Project::PurchaseOrderItem"
  has_one :purchase_entry, class_name: "Project::PurchaseEntry"
  belongs_to :vendor, class_name: "Office::Vendor"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to  :office, class_name:  "Office::Office"
end
