class RenameColumnOfProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_tender_items, :project_purchase_tender_id, :project_tender_id
  end
end
