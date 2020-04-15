class Project::HandoverForm < ApplicationRecord
  belongs_to :project, class_name: "Project::Project"
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :user

end
