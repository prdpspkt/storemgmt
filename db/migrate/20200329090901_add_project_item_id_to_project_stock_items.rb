class AddProjectItemIdToProjectStockItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_stock_items, :project_item_id, :integer
    add_column :project_stock_items, :store_body_id, :integer
  end
end
