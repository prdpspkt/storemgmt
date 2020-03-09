class AddPurchaseOrderIdToOfficePurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entries, :purchase_order_id, :integer
  end
end
