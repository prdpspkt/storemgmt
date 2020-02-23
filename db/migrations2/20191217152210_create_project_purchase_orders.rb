class CreateProjectPurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :project_purchase_orders do |t|
      t.string :vendor_name
      t.string :vendor_address
      t.string :vendor_registration
      t.string :vendor_phone
      t.string :vendor_pan
      t.string :order_no
      t.datetime :order_date
      t.integer :order_decision_no
      t.datetime :order_decision_date
      t.string :office_name
      t.string :office_address
      t.string :store_chief_name
      t.datetime :store_chief_signed_date
      t.string :office_chief_name
      t.datetime :office_chief_signed_date
      t.string :section_chief_name
      t.datetime :section_cheif_signed_date
      t.integer :user_id
      t.string :fy
      t.datetime :fiscal_year_signed_date
      t.integer :office_id
      t.integer :project_id
      t.boolean :marked_as_final

      t.timestamps
    end
  end
end
