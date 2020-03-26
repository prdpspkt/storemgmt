class Project::Tender < ApplicationRecord
  self.table_name = "project_tenders"
  has_many :tender_items, dependent: :destroy, class_name: "Project::TenderItem"
  belongs_to :office, class_name: "Office::Office"
  has_one :purchase_entry, class_name:  "Project::PurchaseEntry"
end
