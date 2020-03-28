class AddReceivedByToProjectReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :project_releases, :received_by, :string
  end
end
