class AddVatableToOfficePurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entry_items, :is_vatable, :boolean
  end
end
