class CreateItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    create_table :item_assistance_register_items do |t|
      t.datetime :date
      t.integer :order_release_no
      t.string :name_of_item_ne
      t.string :name_of_item_en
      t.string :specification
      t.string :item_identification_no
      t.string :model_no
      t.decimal :quantity
      t.decimal :amount
      t.datetime :taken_date
      t.datetime :date_to_be_returned
      t.decimal :returned_quantity
      t.datetime :returned_date
      t.string :name_of_user
      t.integer :user_id
      t.integer :office_id
      t.string :fy
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
