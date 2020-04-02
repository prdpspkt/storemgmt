class AlterTableOfficeItemEvaluationsAndEvaluationItems < ActiveRecord::Migration[5.2]
  def change

    drop_table :office_item_evaluations
    drop_table :office_item_evaluation_items

    create_table "office_item_evaluation_items" do |t|
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
      t.integer "user_id"
      t.integer "office_id"
      t.integer "fiscal_year_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "project_id"
      t.integer "store_body_id"
      t.decimal "rate"
      t.decimal "total_quantity"
      t.string "name_of_item_ne"
      t.integer "item_register_page_no"
      t.integer "item_classification_no"
      t.string "unit_ne"
    end

    create_table "office_item_evaluations", force: :cascade do |t|
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
