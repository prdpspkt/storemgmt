class Office::RepairApplicationForm < ApplicationRecord
  self.table_name = "office_repair_application_forms"
  has_many :repair_application_form_items, class_name: "Office::RepairApplicationFormItem"
end
