class AddTempIdToProjectProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :temp_id, :integer
  end
end
