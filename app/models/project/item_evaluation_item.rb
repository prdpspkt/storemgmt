class Project::ItemEvaluationItem < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :item_evaluation, :class_name => 'Project::ItemEvaluation'
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :project, class_name: "Project::Project"
 end