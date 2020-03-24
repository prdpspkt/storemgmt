class AlterTableProjectPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    drop_table :project_purchase_entries
    create_table "project_purchase_entries" do |t|
      t.datetime "entry_date"
      t.string "bill_no"
      t.integer "entry_no"
      t.string "store_chief_name"
      t.string "store_chief_designation"
      t.datetime "store_chief_signed_date"
      t.string "section_chief_name"
      t.string "section_chief_designation"
      t.datetime "section_chief_signed_date"
      t.string "office_chief_name"
      t.string "office_chief_designation"
      t.datetime "office_chief_signed_date"
      t.integer "user_id"
      t.integer "office_id"
      t.string "fy"
      t.boolean "marked_as_final"
      t.integer "fiscal_year_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "purchase_handover_no"
      t.integer "store_body_id"
      t.boolean "ledger_entry_generated"
      t.integer "purchase_order_id"
    end
  end
end
