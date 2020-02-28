class Office::PurchaseOrder < ApplicationRecord
  has_many :purchase_order_items, :dependent => :delete_all, class_name: "Office::PurchaseOrderItem"
  validates_presence_of :vendor_id
  validates_numericality_of :vendor_id
end
