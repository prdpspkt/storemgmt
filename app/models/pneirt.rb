class Pneirt < ApplicationRecord
  belongs_to :project_purchase_entry_item, optional: true
  belongs_to :project_tender_breakdown_item, optional: true
end
