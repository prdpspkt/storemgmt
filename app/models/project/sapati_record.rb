class Project::SapatiRecord < ApplicationRecord
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :user
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :item, :class_name => 'Project::Item'
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
end
