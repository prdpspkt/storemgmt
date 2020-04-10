class AddGenerateFromProjectPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :project_purchase_entries, :generated_from, :string

  end
end
