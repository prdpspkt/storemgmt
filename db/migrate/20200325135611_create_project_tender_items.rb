class CreateProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tender_items do |t|
        t.integer "store_body_id"
        t.decimal "quantity"
        t.decimal "rate"
        t.decimal "amount"
        t.integer "office_id"
        t.integer "user_id"
        t.datetime "received_date"
        t.integer "tender_id"
        t.string "fy"
        t.integer "fiscal_year_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.integer "item_id"
        t.decimal "sku"
        t.integer "item_classification_no"
        t.string "specification"
        t.string "item_identification_no"
        t.string "model_no"
        t.string "size"
        t.string "approx_age"
        t.string "source"
        t.boolean "is_vatable"
        t.decimal "amount_without_vat"
        t.decimal "vat"
        t.decimal "other_expense"
        t.string "country"
        t.string "remarks"
        t.decimal "total_amount"
        t.integer "item_register_page_no"
      end
  end
end
