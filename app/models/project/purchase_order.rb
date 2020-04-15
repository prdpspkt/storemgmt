class Project::PurchaseOrder < ApplicationRecord
  has_many :purchase_order_items, dependent: :destroy, class_name: "Project::PurchaseOrderItem"
  has_one :purchase_entry, class_name: "Project::PurchaseEntry"
  belongs_to :vendor, class_name: "Office::Vendor"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to  :office, class_name:  "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'

end
