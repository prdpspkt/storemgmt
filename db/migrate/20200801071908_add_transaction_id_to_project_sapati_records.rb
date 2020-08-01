class AddTransactionIdToProjectSapatiRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :project_sapati_records, :project_item_transaction_id, :string
  end
end
