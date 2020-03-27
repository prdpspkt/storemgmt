class AddItemIdToProjectProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_items, :item_id, :integer
  end
end
