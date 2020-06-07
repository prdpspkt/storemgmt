class AddTransactionIdToProjectPurchaseEntryItem < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_entry_items, :item_transaction_id, :integer
  end
end
