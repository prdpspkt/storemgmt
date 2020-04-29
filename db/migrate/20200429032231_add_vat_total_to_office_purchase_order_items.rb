class AddVatTotalToOfficePurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_order_items, :vat, :decimal
    add_column :office_purchase_order_items, :amount, :decimal
  end
end
