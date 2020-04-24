class AddItemIdToProjectSapatiRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :project_sapati_records, :item_id, :integer
    add_column :project_sapati_records, :project_item_id, :integer
  end
end
