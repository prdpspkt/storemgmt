class Project::ItemEvaluation < ApplicationRecord
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  has_many :item_evaluation_items, class_name: "Project::ItemEvaluationItem", dependent: :destroy
end
