class AddPpeiidToProjectTenderBreakdownItems < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_breakdown_items, :project_purchase_entry_item_id, :integer
  end
end
