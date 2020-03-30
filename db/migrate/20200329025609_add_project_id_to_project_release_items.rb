class AddProjectIdToProjectReleaseItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_release_items, :project_id, :integer
  end
end
