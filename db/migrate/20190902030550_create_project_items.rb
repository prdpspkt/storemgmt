class CreateProjectItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_items do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :unit_ne
      t.string :unit_en
      t.integer :item_register_page_no
      t.string :type
      t.decimal :to_be_repaired
      t.decimal :to_be_auctioned
      t.decimal :to_be_conserved
      t.decimal :working
      t.decimal :not_working
      t.integer :project_id
      t.integer :item_id
      t.integer :project_entry_item_id
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
