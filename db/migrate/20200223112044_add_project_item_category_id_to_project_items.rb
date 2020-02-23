class AddProjectItemCategoryIdToProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :project_item_category_id, :integer
  end
end
