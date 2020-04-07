class Office::PurchaseEntry < ApplicationRecord
  has_many :purchase_entry_items, class_name: "Office::PurchaseEntryItem", dependent: :delete_all
  belongs_to :purchase_order, :class_name => 'Office::PurchaseOrder', optional: true
  belongs_to :tender, :class_name => 'Office::Tender', optional: true
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :store_body, class_name: "Office::StoreBody"
end
