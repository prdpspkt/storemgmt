class AddItemTransactionIdToOfficeDemandItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_demand_items, :item_transaction_id, :integer
  end
end
