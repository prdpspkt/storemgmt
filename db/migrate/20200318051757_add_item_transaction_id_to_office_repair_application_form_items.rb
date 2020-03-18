class AddItemTransactionIdToOfficeRepairApplicationFormItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_repair_application_form_items, :item_transaction_id, :integer
  end
end
