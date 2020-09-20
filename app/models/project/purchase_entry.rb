class Project::PurchaseEntry < ApplicationRecord
  has_many :purchase_entry_items, class_name: "Project::PurchaseEntryItem", dependent: :delete_all
  belongs_to :purchase_order, :class_name => 'Project::PurchaseOrder', optional: true
  belongs_to :tender, :class_name => 'Project::Tender', optional:  true
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :user
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
end
