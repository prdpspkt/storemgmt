class AddPurchaseTenderIdToProjectPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_entries, :project_purchase_tender_id, :integer
  end
end
