class CreateRentalRecordRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_record_registers do |t|
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.integer :item_classification_no
      t.boolean :is_taken_in_rent
      t.boolean :is_given_in_rent
      t.string :specification
      t.string :model_no
      t.string :item_identification_no
      t.integer :item_register_page_no
      t.decimal :total_price
      t.string :sotre_chief_name
      t.string :store_chief_designation
      t.datetime :store_chief_signed_date
      t.string :office_chief_name
      t.string :office_chief_designation
      t.datetime :office_chief_signed_date
      t.integer :item_id
      t.integer :office_id
      t.integer :user_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
