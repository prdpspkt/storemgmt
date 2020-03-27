class AddProjectItemIdToProjectProjectPurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_purchase_entry_items, :project_id, :integer
  end
end
