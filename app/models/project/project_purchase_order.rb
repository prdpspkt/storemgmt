class ProjectPurchaseOrder < ApplicationRecord
  has_many :project_purchase_order_items, :dependent => :delete_all
end
