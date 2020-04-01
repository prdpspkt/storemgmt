class AddIdToOfficeItemEvaluationCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_evaluation_committee_members, :item_evaluation_committee_id, :integer
  end
end
