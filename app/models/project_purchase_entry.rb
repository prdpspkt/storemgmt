class ProjectPurchaseEntry < ApplicationRecord
  has_many :project_purchase_entry_items
end
