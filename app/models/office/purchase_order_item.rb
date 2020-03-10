class Office::PurchaseOrderItem < ApplicationRecord
  self.table_name = "office_purchase_order_items"
  belongs_to :purchase_order, class_name: "Office::PurchaseOrder"
  belongs_to :item, class_name: "Office::Item"
end
