class Project::HandoverFormItem < ApplicationRecord
  belongs_to :handover_form, class_name: "Project::HandoverForm"
end
