class CreateProjectMainNonExpensableItemRegisterTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_main_non_expensable_item_register_transactions do |t|
      t.datetime :date
      t.integer :entry_release_no
      t.string :specification
      t.string :item_identification_no
      t.string :model_no
      t.string :company_or_country
      t.string :size
      t.string :age
      t.string :source
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.integer :transaction_type
      t.integer :user_id
      t.integer :item_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :project_main_non_expensable_item_register_id
      t.integer :released_to

      t.timestamps
    end
  end
end
