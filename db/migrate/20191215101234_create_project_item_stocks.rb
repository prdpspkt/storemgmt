class CreateProjectItemStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :project_item_stocks do |t|
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.integer :item_id
      t.integer :project_item_id
      t.integer :office_id
      t.integer :user_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
