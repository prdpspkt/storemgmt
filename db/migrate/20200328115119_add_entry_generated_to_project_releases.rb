class AddEntryGeneratedToProjectReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :project_releases, :entry_generated, :boolean
  end
end
