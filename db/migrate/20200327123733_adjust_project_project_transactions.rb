class AdjustProjectProjectTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_project_transactions, :office_item_id
    remove_column :project_project_transactions, :purchase_entry_item_id
    add_column :project_project_transactions, :project_item_id, :integer
  end
end
