class ProjectTenderItem < ApplicationRecord
  belongs_to :project_purchase_tender
  has_one :project_tender_breakdown
end
