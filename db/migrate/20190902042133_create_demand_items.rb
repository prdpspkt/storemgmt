class CreateDemandItems < ActiveRecord::Migration[5.2]
  def change
    create_table :demand_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.integer :office_item_id
      t.string :specification
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :amount
      t.decimal :rate
      t.string :remark
      t.integer :demand_id
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :item_id

      t.timestamps
    end
  end
end
