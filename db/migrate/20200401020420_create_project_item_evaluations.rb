class CreateProjectItemEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table "project_item_evaluations" do |t|
      t.integer "office_id"
      t.integer "user_id"
      t.integer "fiscal_year_id"
      t.integer "item_evaluation_committee_id"
      t.string "report_name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
