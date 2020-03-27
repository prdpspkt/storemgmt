class AddTwoIdsToProjectProjectPurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_purchase_entry_items, :item_transaction_id, :integer
    add_column :project_project_purchase_entry_items, :project_item_transaction_id, :integer
  end
end
