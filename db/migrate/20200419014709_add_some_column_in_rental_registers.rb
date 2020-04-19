class AddSomeColumnInRentalRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :office_rental_record_registers, :item_classification_no, :integer
  end
end
