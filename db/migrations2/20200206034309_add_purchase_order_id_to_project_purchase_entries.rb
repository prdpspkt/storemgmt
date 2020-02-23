class AddPurchaseOrderIdToProjectPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_entries, :project_purchase_order_id, :integer
  end
end
