class Office::ItemEvaluationCommitteeMember < ApplicationRecord
  belongs_to :item_evaluation_committee, :class_name => 'Office::ItemEvaluationCommittee'
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :user
  belongs_to :personnel, :class_name => 'Office::Personnel'
end
