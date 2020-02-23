class CreateProjectStockItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_stock_items do |t|
      t.integer :item_register_page_no
      t.integer :item_classification_no
      t.string :name_of_item_en
      t.string :name_of_item_ne
      t.string :unit_en
      t.string :unit_ne
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.string :physical_status
      t.string :remarks
      t.integer :office_id
      t.integer :project_id
      t.integer :item_id
      t.integer :user_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
