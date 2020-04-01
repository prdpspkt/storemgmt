class CreateProjectItemEvaluationItems < ActiveRecord::Migration[5.2]
  def change
    create_table "project_item_evaluation_items" do |t|
      t.decimal "quantity"
      t.decimal "amount"
      t.decimal "matched"
      t.decimal "unmatched"
      t.decimal "dquantity"
      t.decimal "iquantity"
      t.decimal "diquantity"
      t.decimal "working"
      t.integer "item_evaluation_id"
      t.decimal "notworking"
      t.decimal "to_be_repaired"
      t.decimal "to_be_auctioned"
      t.decimal "to_be_disposed"
      t.decimal "to_be_conserved"
      t.decimal "total_amount"
      t.string "remarks"
      t.integer "item_id"
      t.integer "office_item_id"
      t.integer "user_id"
      t.integer "office_id"
      t.integer "fiscal_year_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
