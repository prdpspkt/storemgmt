class AddItemTransactionIdToOfficeRentalRecordRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :office_rental_record_registers, :item_transaction_id, :integer
  end
end
