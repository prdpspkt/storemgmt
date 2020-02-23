class AddSomeoftheColumnsToProjectPurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_order_items, :amount_with_out_vat, :decimal
    add_column :project_purchase_order_items, :vat, :decimal
  end
end
