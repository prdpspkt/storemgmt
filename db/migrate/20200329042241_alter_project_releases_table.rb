class AlterProjectReleasesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_releases, :marked_as_final
    add_column :project_releases, :accepted, :boolean

  end
end
