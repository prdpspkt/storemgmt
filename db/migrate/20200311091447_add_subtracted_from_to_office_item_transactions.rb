class AddSubtractedFromToOfficeItemTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :office_transactions, :subed_from, :integer
  end
end
