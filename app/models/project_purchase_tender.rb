class ProjectPurchaseTender < ApplicationRecord
  has_many :project_tender_items, dependent: :destroy
  belongs_to :office
  has_many :project_tender_breakdowns
end
