class AddVendorIdToProjectPurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_orders, :vendor_id, :integer
  end
end
