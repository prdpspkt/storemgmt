class CreateOeirts < ActiveRecord::Migration[5.2]
  def change
    create_table :oeirts do |t|
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
      t.string :remarks
      t.integer :office_purchase_entry_item_id
    end
  end
end
