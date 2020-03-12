class AddSubtractedFromToOfficeItemTransactions2 < ActiveRecord::Migration[5.2]
  def change
    add_column :office_release_items, :subed_from, :integer
  end
end
