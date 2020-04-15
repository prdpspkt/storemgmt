class Project::HandoverFormItem < ApplicationRecord
  belongs_to :handover_form, class_name: "Project::HandoverForm"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
end
