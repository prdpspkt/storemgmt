class AlterStockAndStockItemTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :office_stocks
    drop_table :office_stock_items
    create_table "office_stock_items" do |t|
      t.decimal "quantity"
      t.decimal "rate"
      t.decimal "amount"
      t.string "physical_status"
      t.string "remarks"
      t.integer "office_id"
      t.integer "item_id"
      t.integer "user_id"
      t.integer "fiscal_year_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "store_body_id"
      t.integer "stock_id"
    end

    create_table "office_stocks" do |t|
      t.datetime "store_chief_signed_date"
      t.datetime "section_chief_signed_date"
      t.datetime "office_chief_signed_date"
      t.integer "store_body_id"
      t.integer "office_id"
      t.integer "project_id"
      t.integer "user_id"
      t.integer "fiscal_year_id"
      t.boolean "accepted"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
