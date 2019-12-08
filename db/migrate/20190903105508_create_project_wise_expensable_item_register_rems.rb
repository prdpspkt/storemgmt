class CreateProjectWiseExpensableItemRegisterRems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_wise_expensable_item_register_rems do |t|
      t.integer :office_item_id
      t.decimal :quantity
      t.decimal :amount
      t.integer :project_wise_expensable_item_register_transaction_id
      t.integer :item_id
      t.timestamps
    end
  end
end
