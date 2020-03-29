class AddStoreBodyIdToProjectDemands < ActiveRecord::Migration[5.2]
  def change
    add_column :project_demands, :store_body_id, :integer
  end
end
