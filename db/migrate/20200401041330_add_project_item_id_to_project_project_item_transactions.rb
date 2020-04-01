class AddProjectItemIdToProjectProjectItemTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_item_transactions, :project_id, :integer
  end
end
