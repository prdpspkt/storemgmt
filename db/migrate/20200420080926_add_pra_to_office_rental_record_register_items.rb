class AddPraToOfficeRentalRecordRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_rental_record_register_items, :pr_amount, :decimal
  end
end
