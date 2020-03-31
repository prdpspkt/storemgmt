class CreateOfficeItemEvaluationCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :office_item_evaluation_committee_members do |t|
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.integer :personnel_id
      t.string :role

      t.timestamps
    end
  end
end
