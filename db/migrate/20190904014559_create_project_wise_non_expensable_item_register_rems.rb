class CreateProjectWiseNonExpensableItemRegisterRems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_wise_non_expensable_item_register_rems do |t|
      t.integer :item_id
      t.integer :project_item_id
      t.decimal :quantity
      t.decimal :amount
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
