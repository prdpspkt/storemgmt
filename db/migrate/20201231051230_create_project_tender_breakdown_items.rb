class CreateProjectTenderBreakdownItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tender_breakdown_items do |t|
      t.project_
      t.integer "item_classification_no"
      t.integer "item_register_page_no"
      t.string "name_of_item_ne"
      t.string "name_of_item_en"
      t.string "specification"
      t.string "item_identification_no"
      t.string "model_no"
      t.string "unit_ne"
      t.string "unit_en"
      t.decimal "quantity"
      t.decimal "rate"
      t.decimal "amount_without_vat"
      t.decimal "vat"
      t.decimal "total_amount"
      t.decimal "other_expense"
      t.decimal "amount"
      t.string "remarks"
      t.integer "user_id"
      t.integer "office_id"
      t.string "fy"
      t.integer "item_id"
      t.integer "fiscal_year_id"
      t.integer "project_item_id"
      t.string "country"
      t.string "size"
      t.string "approx_age"
      t.string "source"
      t.boolean "is_vatable"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.decimal "sku"
    end
  end
end
