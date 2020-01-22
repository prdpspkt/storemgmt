class ProjectPurchaseTender < ApplicationRecord
  has_many :project_tender_items, dependent: :destroy
  belongs_to :office
  has_one :project_purchase_entry
end
