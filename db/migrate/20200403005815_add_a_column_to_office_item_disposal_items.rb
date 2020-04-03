class AddAColumnToOfficeItemDisposalItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_disposal_items, :new_item_transaction_id, :integer
  end
end
