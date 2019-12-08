class CreateProjectWiseExpensableItemRegisterTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_wise_expensable_item_register_transactions do |t|
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
      t.integer :project_id
      t.integer :project_wise_expensable_item_register_page_id
      t.integer :item_id
      t.timestamps
    end
  end
end
