class CreateOfficeItemEvaluationCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :office_item_evaluation_committees do |t|
      t.integer :office_item_evaluation_id
      t.string :name
      t.string :designation
      t.integer :user_id
      t.integer :fiscal_year_id
      t.integer :office_id

      t.timestamps
    end
  end
end
