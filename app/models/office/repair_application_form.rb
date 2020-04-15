class Office::RepairApplicationForm < ApplicationRecord
  has_many :repair_application_form_items, class_name: "Office::RepairApplicationFormItem"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :vendor, class_name: "Office::Vendor"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to :user
end
