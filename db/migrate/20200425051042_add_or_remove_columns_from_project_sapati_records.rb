class AddOrRemoveColumnsFromProjectSapatiRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_sapati_records, :from_item_id
    remove_column :project_sapati_records, :to_item_id
    add_column :project_sapati_records, :sapati_returned, :boolean
  end
end
