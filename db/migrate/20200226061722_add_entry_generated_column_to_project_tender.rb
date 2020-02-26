class AddEntryGeneratedColumnToProjectTender < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tenders, :entry_generated, :boolean
  end
end
