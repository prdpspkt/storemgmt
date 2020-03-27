class AddAndRemoveSomeColumnsFromProjectPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_project_purchase_entries, :tender_id
    remove_column :project_project_purchase_entries, :purchase_order_id
    add_column :project_project_purchase_entries, :purchase_entry_id, :integer
  end
end
