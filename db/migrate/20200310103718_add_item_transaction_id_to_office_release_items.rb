class AddItemTransactionIdToOfficeReleaseItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_release_items, :item_transaction_id, :integer
  end
end
