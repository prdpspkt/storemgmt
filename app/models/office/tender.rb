class Office::Tender < ApplicationRecord
  has_many :tender_items, dependent: :destroy, class_name: "Office::TenderItem"
  belongs_to :office, class_name: "Office::Office"
  has_one :purchase_entry, class_name:  "Office::PurchaseEntry"
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
end
