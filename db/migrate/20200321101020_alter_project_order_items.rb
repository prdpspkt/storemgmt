class AlterProjectOrderItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :project_purchase_order_items
    create_table "project_purchase_order_items", force: :cascade do |t|
      t.string "specification"
      t.decimal "quantity"
      t.decimal "rate"
      t.decimal "amount"
      t.string "remarks"
      t.integer "purchase_order_id"
      t.integer "office_id"
      t.integer "user_id"
      t.string "fy"
      t.integer "fiscal_year_id"
      t.integer "item_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.decimal "vat"
      t.decimal "amount_without_vat"
      t.boolean "is_vatable"
    end
  end
end
