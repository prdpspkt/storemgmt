class CreateOfficeItemEvaluationCommittees < ActiveRecord::Migration[5.2]
  def change
    drop_table :office_item_evaluation_committees
    create_table :office_item_evaluation_committees do |t|
      t.integer :user_id
      t.integer :office_id
      t.string :name
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
