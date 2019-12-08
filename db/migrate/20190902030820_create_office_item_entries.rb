class CreateOfficeItemEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :office_item_entries do |t|
      t.integer :item_registration_page_no
      t.integer :office_item_id
      t.integer :item_id
      t.decimal :rate
      t.decimal :quantity
      t.decimal :amount
      t.integer :user_id
      t.integer :office_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
