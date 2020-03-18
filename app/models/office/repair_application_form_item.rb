class Office::RepairApplicationFormItem < ApplicationRecord
  self.table_name = "office_repair_application_form_items"
  belongs_to :repair_application_form, class_name: "Office::RepairApplicationForm"
  belongs_to :item, class_name: "Office::Item"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :item_transaction, class_name: "Office::ItemTransaction"
end
