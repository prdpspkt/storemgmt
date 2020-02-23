class CreateProjectEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :project_evaluations do |t|
      t.string :fy
      t.datetime :committee_formation_date
      t.datetime :report_submission_date
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
