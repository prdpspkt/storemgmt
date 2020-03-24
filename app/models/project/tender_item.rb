class Project::TenderItem < ApplicationRecord
  belongs_to :tender, class_name: "Project::Tender"
  has_one :ptneit, :class_name => 'Project::Ptneit'
  has_one :pteit, :class_name => 'Project::Pteit'
end
