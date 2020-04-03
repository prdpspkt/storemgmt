class AddOrRemoveColumns2FormItemDisposalItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_disposal_items, :item_transaction_id, :integer
  end
end
