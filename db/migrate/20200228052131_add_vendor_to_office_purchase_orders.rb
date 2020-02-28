class AddVendorToOfficePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :vendor_id, :integer
  end
end
