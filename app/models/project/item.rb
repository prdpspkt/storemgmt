class Project::Item < ApplicationRecord
self.table_name = "project_items"
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :item_category, class_name: "Project::ItemCategory"
  has_many :item_transactions, class_name: "Project::ItemTransaction"
  has_many :tender_items, :class_name => 'Project::TenderItem'
end
