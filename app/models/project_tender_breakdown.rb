class ProjectTenderBreakdown < ApplicationRecord
  belongs_to :office
  belongs_to :project_purchase_tender
  belongs_to :project
  has_many :project_tender_breakdown_items

end
