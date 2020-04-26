class AddSpecificationToOfficeItemTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_transactions, :specification, :string
  end
end
