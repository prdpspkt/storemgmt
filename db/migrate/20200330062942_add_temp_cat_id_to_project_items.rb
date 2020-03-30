class AddTempCatIdToProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :temp_cat_id, :integer
  end
end
