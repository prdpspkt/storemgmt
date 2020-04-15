class Office::FiscalYear < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  has_many :item_transactions, :class_name => 'Project::ItemTransaction'
  has_many :project_item_transactions, :class_name => 'Project::ProjectItemTransaction'
  has_many :store_bodies, :class_name => 'Office::StoreBody'
  belongs_to :user
end
