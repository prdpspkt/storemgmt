class CreateOfficeReleaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :office_release_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.integer :item_register_page_no
      t.string :code_no
      t.string :specification
      t.string :unit_ne
      t.string :unit_en
      t.decimal :quantity
      t.decimal :rate
      t.decimal :amount
      t.string :remarks
      t.integer :office_item_id
      t.integer :office_release_id
      t.integer :user_id
      t.integer :office_id
      t.integer :item_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
