class AddNameEnToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :vendor_name_en, :string
  end
end
