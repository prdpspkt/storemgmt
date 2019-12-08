class AddPurchaseNoToOfficePurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entries, :purchase_handover_no, :integer
  end
end
