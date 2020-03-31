class Project::ProjectPurchaseEntry < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :project, class_name: "Project::Project"
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  has_many :project_purchase_entry_items, :class_name => 'Project::ProjectPurchaseEntryItem', dependent: :destroy
  belongs_to :purchase_entry, :class_name => 'Project::PurchaseEntry'
end
