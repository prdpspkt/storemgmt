class AddIsVatableToProjectPurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_order_items, :is_vatable, :boolean
  end
end
