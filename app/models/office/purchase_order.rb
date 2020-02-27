class Office::PurchaseOrder < ApplicationRecord
  has_many :purchase_order_items, :dependent => :delete_all, class_name: "Office::PurchaseOrderItem"
end
