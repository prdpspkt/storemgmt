class AddStockIdToProjectStockItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_stock_items, :stock_id, :integer
  end
end
