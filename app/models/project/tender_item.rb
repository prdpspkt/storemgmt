class Project::TenderItem < ApplicationRecord
  belongs_to :tender, class_name: "Project::Tender"
  belongs_to :item, class_name: "Project::Item"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
end
