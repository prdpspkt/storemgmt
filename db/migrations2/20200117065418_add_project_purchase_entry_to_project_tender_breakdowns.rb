class AddProjectPurchaseEntryToProjectTenderBreakdowns < ActiveRecord::Migration[5.2]
  def change
    add_column :project_tender_breakdowns, :project_purchase_entry_id, :integer
    remove_column :project_tender_breakdowns, :project_purchase_tender_id
  end
end
