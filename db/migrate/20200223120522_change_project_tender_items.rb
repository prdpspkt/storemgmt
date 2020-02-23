class ChangeProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_tender_items, :item_id, :project_item_id
  end
end
