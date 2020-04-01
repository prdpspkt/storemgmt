class RenameProjectsToProjectProjects < ActiveRecord::Migration[5.2]
  def change
    rename_table :projects, :project_projects
  end
end
