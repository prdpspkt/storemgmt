class AddItemClassificationNoToProjectProjectItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_project_items, :item_classification_no, :integer
  end
end
