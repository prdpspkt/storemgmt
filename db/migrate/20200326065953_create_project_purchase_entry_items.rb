class CreateProjectPurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_project_purchase_entry_items do |t|
      t.integer :item_classification_no
      t.integer :item_register_page_no
      t.integer :item_id
      t.integer :project_item_id
      t.string :model_no
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount_without_vat
      t.decimal :vat
      t.decimal :total_amount
      t.decimal :other_expense
      t.decimal :amount
      t.string :remarks
      t.integer :project_purchase_entry_id
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.string :country
      t.string :size
      t.string :approx_age
      t.string :source
      t.boolean :is_vatable

      t.timestamps
    end
  end
end
