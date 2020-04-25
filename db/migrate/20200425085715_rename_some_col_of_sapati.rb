class RenameSomeColOfSapati < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_sapati_records, :to, :to_project
    rename_column :project_sapati_records, :from, :from_project
  end
end
