class AddDemandIdToProjectDemandItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_demand_items, :demand_id, :integer
  end
end
