class Office::PurchaseOrderItem < ApplicationRecord
  belongs_to :purchase_order, class_name: "Office::PurchaseOrder"
end
