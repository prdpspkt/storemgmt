class AddSkuToProjectPurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_entry_items, :sku, :decimal
  end
end
