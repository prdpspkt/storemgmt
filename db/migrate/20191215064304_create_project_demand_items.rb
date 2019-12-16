class CreateProjectDemandItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_demand_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :specification
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :amount
      t.decimal :rate
      t.string :remark
      t.integer :user_id
      t.integer :office_id
      t.integer :project_id
      t.integer :project_item_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :item_id
      t.integer :project_demand_id

      t.timestamps
    end
  end
end
