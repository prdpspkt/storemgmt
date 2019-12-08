class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.string :name_ne
      t.string :name_en
      t.string :unit_ne
      t.string :unit_en
      t.integer :user_id
      t.integer :office_id

      t.timestamps
    end
  end
end
