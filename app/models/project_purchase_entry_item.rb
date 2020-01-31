class ProjectPurchaseEntryItem < ApplicationRecord
  belongs_to :project_purchase_entry
  belongs_to :item
end
