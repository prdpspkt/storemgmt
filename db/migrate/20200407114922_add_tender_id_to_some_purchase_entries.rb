class AddTenderIdToSomePurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :office_purchase_entries, :tender_id, :integer
    add_column :project_purchase_entries, :tender_id, :integer
  end
end
