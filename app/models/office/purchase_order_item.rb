class Office::PurchaseOrderItem < ApplicationRecord
  belongs_to :purchase_order, class_name: "Office::PurchaseOrder"
  belongs_to :pool_item, class_name: "Office::PoolItem"
  belongs_to :item, :class_name => 'Office::Item', optional: true
  belongs_to :user
end
