class Office::ItemEvaluationCommittee < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user, class_name: "User"
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  has_many :item_evaluation_committee_members, :class_name => 'Office::ItemEvaluationCommitteeMember'
end
