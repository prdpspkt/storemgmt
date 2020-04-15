class Project::Tender < ApplicationRecord
  has_many :tender_items, dependent: :destroy, class_name: "Project::TenderItem"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  has_one :purchase_entry, class_name:  "Project::PurchaseEntry"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
end
