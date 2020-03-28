class AddColumnToProjectDemands < ActiveRecord::Migration[5.2]
  def change
    add_column :project_demands, :entry_generated, :boolean
  end
end
