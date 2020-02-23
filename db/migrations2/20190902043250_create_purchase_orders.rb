class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.string :vendor_name
      t.string :vendor_address
      t.string :vendor_registration
      t.string :vendor_phone
      t.string :vendor_pan
      t.integer :order_no
      t.datetime :order_date
      t.integer :order_decision_no
      t.datetime :order_decision_date
      t.datetime :date_to_receive_goods
      t.string :office_name
      t.string :office_address
      t.string :store_chief_name
      t.datetime :store_chief_signed_date
      t.string :section_chief_name
      t.datetime :section_chief_signed_date
      t.datetime :office_cheif_signed_date
      t.string :office_cheif_name
      t.integer :user_id
      t.string :fy
      t.integer :fiscal_year_id
      t.integer :office_id
      t.boolean :marked_as_final
      t.timestamps
    end
  end
end
