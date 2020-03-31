class RenameTables3 < ActiveRecord::Migration[5.2]
  def change
    rename_table :office_transactions, :office_item_transactions
    rename_table :project_transactions, :project_item_transactions
  end
end
