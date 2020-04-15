class Office::Vendor < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
end
