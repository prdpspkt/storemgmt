class Office::PurchaseOrderItem < ApplicationRecord
  belongs_to :purchase_order, class_name: "Office::PurchaseOrder"
  belongs_to :item, class_name: "Office::Item"
end
