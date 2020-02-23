class CreateRepairRecordRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :repair_record_registers do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :page_no
      t.string :specificaiton
      t.string :item_identification
      t.string :model
      t.integer :item_register_page_no
      t.decimal :price
      t.string :store_chief_name
      t.string :sotre_chief_designation
      t.datetime :store_chief_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.datetime :office_chief_signed_date
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id
      t.string :month
      t.string :year
      t.integer :office_item_id
      t.integer :item_id
      t.timestamps
    end
  end
end
