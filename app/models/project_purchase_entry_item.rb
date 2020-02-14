class ProjectPurchaseEntryItem < ApplicationRecord
  belongs_to :project_purchase_entry
  belongs_to :item
  has_one :peirt, dependent:  :destroy
  has_one :pneirt, dependent: :destroy
  has_one :project_tender_breakdown_item
end
