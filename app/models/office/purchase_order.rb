class Office::PurchaseOrder < ApplicationRecord
  has_many :purchase_order_items, class_name: "Office::PurchaseOrderItem", dependent: :destroy
  belongs_to :vendor, class_name: "Office::Vendor"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to :office, class_name: "Office::Office"
  validates_presence_of :vendor_id
  validates_numericality_of :vendor_id
end
