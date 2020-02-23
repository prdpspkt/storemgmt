class CreateProjectPurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_purchase_order_items do |t|
      t.integer :item_classification_no
      t.string :name_of_item_en
      t.string :name_of_item_ne
      t.string :specification
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.string :remarks
      t.integer :project_purchase_order_id
      t.integer :office_id
      t.integer :item_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :project_id

      t.timestamps
    end
  end
end
