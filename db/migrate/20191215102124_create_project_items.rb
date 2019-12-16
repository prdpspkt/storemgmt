class CreateProjectItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :specification
      t.string :unit_ne
      t.string :unit_en
      t.integer :item_register_page_no
      t.integer :item_classification_no
      t.integer :item_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.integer :project_id
      t.string :model_no
      t.integer :item_identification_no

      t.timestamps
    end
  end
end
