class AlterSomeColumnsInProjectReleaseItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_release_items, :release_from
    add_column :project_release_items, :item_transaction_id, :integer
    add_column :project_release_items, :project_item_transaction_id, :integer
  end
end
