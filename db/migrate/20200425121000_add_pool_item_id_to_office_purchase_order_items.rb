class AddPoolItemIdToOfficePurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_order_items, :pool_item_id, :integer
    add_column :office_tender_items, :pool_item_id, :integer
  end
end
