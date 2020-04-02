class Office::ItemEvaluation < ApplicationRecord
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  has_many :item_evaluation_items, class_name: "Office::ItemEvaluationItem", dependent: :destroy
  belongs_to :item_evaluation_committee, :class_name => 'Office::ItemEvaluationCommittee'
end
