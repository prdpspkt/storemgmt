class ProjectPurchaseEntry < ApplicationRecord
  has_many :project_purchase_entry_items
  belongs_to :project_purchase_tender, optional: true
end
