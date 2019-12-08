class CreateProjectItemEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :project_item_evaluations do |t|
      t.string :office_code
      t.string :fy
      t.datetime :committee_formation_date
      t.datetime :report_submission_date
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
