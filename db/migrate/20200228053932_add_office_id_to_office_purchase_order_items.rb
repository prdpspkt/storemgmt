class AddOfficeIdToOfficePurchaseOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_order_items, :office_item_id, :integer
  end
end
