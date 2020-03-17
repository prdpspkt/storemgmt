class AddItemTransactionIdToOfficeItemAssistanceRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_assistance_register_items, :item_transaction_id, :integer
  end
end
