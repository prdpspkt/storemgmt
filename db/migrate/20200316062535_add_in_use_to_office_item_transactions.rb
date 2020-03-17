class AddInUseToOfficeItemTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :office_transactions, :in_use, :boolean
  end
end
