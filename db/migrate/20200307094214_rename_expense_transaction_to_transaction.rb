class RenameExpenseTransactionToTransaction < ActiveRecord::Migration[5.2]
  def change
    rename_table :office_expense_transactions, :office_transactions
  end
end
