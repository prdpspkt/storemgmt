class Project::TenderItem < ApplicationRecord
  self.table_name = "project_tender_items"
  belongs_to :tender, class_name: "Project::Tender"
  belongs_to :item, class_name: "Project::Item"
  belongs_to :item, :class_name => 'Project::Item'
end
