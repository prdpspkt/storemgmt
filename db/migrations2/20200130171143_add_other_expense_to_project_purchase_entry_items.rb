class AddOtherExpenseToProjectPurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :project_purchase_entry_items, :other_expenses, :other_expense
  end
end
