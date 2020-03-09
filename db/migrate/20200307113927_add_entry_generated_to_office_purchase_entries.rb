class AddEntryGeneratedToOfficePurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entries, :ledger_entry_generated, :boolean
  end
end
