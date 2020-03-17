class Office::RepairApplicationFormItem < ApplicationRecord
  self.table_name = "office_repair_application_form_items"
  belongs_to :repair_application_form, class_name: "Office::RepairApplicationForm"
end
