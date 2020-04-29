class AddVatTotalToProjectPurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_order_items, :vat, :decimal
    add_column :project_purchase_order_items, :amount, :decimal
  end
end
