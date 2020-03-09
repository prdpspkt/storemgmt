class Project::ItemCategory < ApplicationRecord
  self.table_name = "project_item_categories"
  belongs_to :office_office, :class_name => 'Office::Office'
end
