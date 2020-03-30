class AddTempIdToProjectItemCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :project_item_categories, :temp_id, :integer
  end
end
