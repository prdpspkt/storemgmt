class AddSomeColsToProjectSapatiRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :project_sapati_records, :source_it_id, :integer
    add_column :project_sapati_records, :destin_it_id, :integer
  end
end
