class AddDemandIdToProjectReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :project_releases, :demand_id, :integer
  end
end
