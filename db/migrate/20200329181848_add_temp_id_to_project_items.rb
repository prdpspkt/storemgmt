class AddTempIdToProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :temp_id, :integer
  end
end
