class AddItemIdToProjectTenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_items, :item_id, :integer
  end
end
