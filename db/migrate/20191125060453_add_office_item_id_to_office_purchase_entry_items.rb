class AddOfficeItemIdToOfficePurchaseEntryItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entry_items, :office_item_id, :integer
  end
end
