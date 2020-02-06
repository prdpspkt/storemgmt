class ProjectPurchaseOrder < ApplicationRecord
  has_many :project_purchase_order_items, dependent: :destroy
  has_one :project_purchase_entry
end
