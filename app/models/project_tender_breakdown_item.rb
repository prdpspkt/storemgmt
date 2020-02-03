class ProjectTenderBreakdownItem < ApplicationRecord
  belongs_to :project_tender_breakdown
  belongs_to :project_purchase_entry_item
end
