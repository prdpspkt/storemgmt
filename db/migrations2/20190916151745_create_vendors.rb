class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :vendor_name
      t.string :vendor_registration
      t.string :vendor_pan
      t.string :vendor_address
      t.string :vendor_representive
      t.string :vendor_phone
      t.string :vendor_email
      t.integer :fiscal_year_id
      t.integer :office_id
      t.integer :user_id

      t.timestamps
    end
  end
end
