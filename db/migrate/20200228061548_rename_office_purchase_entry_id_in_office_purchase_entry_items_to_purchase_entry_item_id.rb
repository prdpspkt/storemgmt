class RenameOfficePurchaseEntryIdInOfficePurchaseEntryItemsToPurchaseEntryItemId < ActiveRecord::Migration[5.2]
  def change
    rename_column :office_purchase_entry_items, :office_purchase_entry_id, :purchase_entry_id
  end
end
