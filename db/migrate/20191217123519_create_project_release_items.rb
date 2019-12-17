class CreateProjectReleaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_release_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.integer :item_register_page_no
      t.string :code_no
      t.string :specificaiton
      t.string :unit_en
      t.string :unit_ne
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.string :remarks
      t.integer :project_item_id
      t.integer :project_release_id
      t.integer :user_id
      t.integer :office_id
      t.integer :item_id
      t.integer :fiscal_year_id
      t.integer :release_from
      t.string :item_classification_no

      t.timestamps
    end
  end
end
