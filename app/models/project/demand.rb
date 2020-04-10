class Project::Demand < ApplicationRecord
  belongs_to :project, class_name: "Project::Project"
  has_many :demand_items, class_name: "Project::DemandItem", dependent: :destroy
  belongs_to :office, class_name: "Office::Office"
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
end
