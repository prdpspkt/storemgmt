class Office::ItemEvaluationItem < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :item_evaluation, :class_name => 'Office::ItemEvaluation'
  belongs_to :item, :class_name => 'Office::Item'
  belongs_to :user
 end