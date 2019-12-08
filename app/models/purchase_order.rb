class PurchaseOrder < ApplicationRecord
  has_many :purchase_order_items, :dependent => :delete_all
end
