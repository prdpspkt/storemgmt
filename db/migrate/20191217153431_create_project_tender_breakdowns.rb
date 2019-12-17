class CreateProjectTenderBreakdowns < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tender_breakdowns do |t|
      t.integer :office_id
      t.integer :user_id
      t.integer :project_tender_id
      t.integer :project_id
      t.string :project_name_en
      t.string :project_name_ne
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
