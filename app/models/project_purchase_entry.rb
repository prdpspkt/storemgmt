class ProjectPurchaseEntry < ApplicationRecord
  has_many :project_purchase_entry_items, dependent: :destroy
  belongs_to :project_purchase_tender, optional: true
  belongs_to :project_purchase_order, optional: true
end
