class Project::Project < ApplicationRecord
  belongs_to :user
  has_many :project_items, class_name: "Project::ProjectItem"
  belongs_to :office, class_name: "Office::Office"
  has_many :demands, class_name: "Project::Demand"
  has_many :releases, class_name: "Project::Release"
  has_many :purchase_entry, class_name: "Project::PurchaseEntry"
  has_many :purchase_order, class_name: "Project::PurchaseOrder"
  has_many :project_item_transactions, :class_name => 'Project::ProjectItemTransaction'
end
