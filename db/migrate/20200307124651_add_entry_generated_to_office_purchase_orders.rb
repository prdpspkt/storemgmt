class AddEntryGeneratedToOfficePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_orders, :entry_generated, :boolean
  end
end
