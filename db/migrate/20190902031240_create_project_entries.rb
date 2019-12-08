class CreateProjectEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :project_entries do |t|
      t.integer :item_register_page_no
      t.integer :project_entry_item_id
      t.decimal :rate
      t.decimal :quantity
      t.decimal :amount
      t.integer :released_to
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id
      t.integer :item_id

      t.timestamps
    end
  end
end
