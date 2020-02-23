class CreateOneirts < ActiveRecord::Migration[5.2]
  def change
    create_table :oneirts do |t|
      t.string :model
      t.string :item_identification_no
      t.string :country_of_origin
      t.integer :office_item_id
      t.integer :item_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.integer :user_id
      t.datetime :transaction_date
      t.integer :transaction_type
      t.decimal :rate
      t.decimal :amount
      t.decimal :quantity
      t.integer :office_purchase_entry_item_id
      t.string :remarks

    end
  end
end
