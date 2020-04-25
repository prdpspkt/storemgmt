class CreateProjectPoolItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_pool_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :unit_ne
      t.string :unit_en
      t.integer :item_category_id

      t.timestamps
    end
  end
end
