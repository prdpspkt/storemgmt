class ReviseItemEvaluationCommittee < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_evaluation_committees, :committee_formation_date, :datetime
    add_column :office_item_evaluation_committees, :report_submission_date, :datetime
  end
end
