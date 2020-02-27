class Office::RepairApplicationFormItem < ApplicationRecord
  belongs_to :repair_application_form, class_name: "Office::RepairApplicationForm"
end
