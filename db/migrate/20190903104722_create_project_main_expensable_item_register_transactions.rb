class CreateProjectMainExpensableItemRegisterTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_main_expensable_item_register_transactions do |t|
      t.datetime :date
      t.integer :entry_release_no
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.integer :transaction_type
      t.string :remarks
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :project_main_expensable_item_register_id
      t.integer :released_to
      t.integer :item_id

      t.timestamps
    end
  end
end
