class AddItemIdentificationToProjectProjectPurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_purchase_entry_items, :item_identification_no, :string
  end
end
