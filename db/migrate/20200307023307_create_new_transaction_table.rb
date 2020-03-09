class CreateNewTransactionTable < ActiveRecord::Migration[5.2]
  def change
    create_table "office_expense_transactions" do |t|
      t.string "model"
      t.string "item_identification_no"
      t.string "country_of_origin"
      t.integer "office_item_id"
      t.integer "item_id"
      t.integer "office_id"
      t.integer "fiscal_year_id"
      t.integer "user_id"
      t.datetime "transaction_date"
      t.integer "transaction_type"
      t.decimal "rate"
      t.decimal "amount"
      t.decimal "quantity"
      t.integer "purchase_entry_item_id"
      t.string "remarks"
      t.decimal "sku"
      t.integer "release_item_id"
      t.integer "entry_no"
      t.string "country"
      t.string "size"
      t.string "approx_age"
      t.string "source"
      t.integer "handover_form_item_id"
      t.integer "item_classification_no"
    end
   end
end
