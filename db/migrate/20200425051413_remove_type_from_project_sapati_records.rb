class RemoveTypeFromProjectSapatiRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_sapati_records, :type
  end
end
