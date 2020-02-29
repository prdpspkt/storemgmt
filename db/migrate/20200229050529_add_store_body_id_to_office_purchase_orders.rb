class AddStoreBodyIdToOfficePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :store_body_id, :integer
  end
end
