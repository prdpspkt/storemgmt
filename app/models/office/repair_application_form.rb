class Office::RepairApplicationForm < ApplicationRecord
  has_many :repair_application_form_items, class_name: "Office::RepairApplicationFormItem"
end
