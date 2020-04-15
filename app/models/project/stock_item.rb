class Project::StockItem < ApplicationRecord
  belongs_to  :stock, :class_name => 'Project::Stock'
  belongs_to :item, :class_name => 'Project::Item'
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :project, :class_name => 'Project::Project'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user

end
