class ProjectTenderItem < ApplicationRecord
  belongs_to :project_purchase_tender
  has_many :project_tender_breakdown_items, dependent: :destroy
end
