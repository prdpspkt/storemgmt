class AddAmountVatEtcToPurchaseOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_order_items, :vat, :decimal
    add_column :purchase_order_items, :amount_without_vat, :decimal
    add_column :purchase_order_items, :is_vatable, :boolean
  end
end
