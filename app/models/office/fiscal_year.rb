class Office::FiscalYear < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  has_many :item_transactions, :class_name => 'Project::ItemTransaction'
  has_many :project_item_transactions, :class_name => 'Project::ProjectItemTransaction'
end
