class AlterSomeColumnInRentalRegisters < ActiveRecord::Migration[5.2]
  def change
      rename_column :office_rental_record_registers, :store_chief_signed_date, :store_keeper_signed_date
  end
end
