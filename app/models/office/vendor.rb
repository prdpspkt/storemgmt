class Office::Vendor < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  has_many :project_purchse_entry, class_name: "Project::PurchaseEntry"
end
