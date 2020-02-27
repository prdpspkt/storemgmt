class ProjectTenderItem < ApplicationRecord
  belongs_to :project_tender
  has_one :ptneit, :class_name => 'Project::Ptneit'
  has_one :pteit, :class_name => 'Project::Pteit'
end
