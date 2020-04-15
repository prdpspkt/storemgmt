class Office::ItemDisposal < ApplicationRecord
  has_many :disposal_items, class_name: "Office::ItemDisposalItem"
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  belongs_to :user

end
