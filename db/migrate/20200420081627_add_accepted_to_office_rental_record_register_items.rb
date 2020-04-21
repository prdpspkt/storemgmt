class AddAcceptedToOfficeRentalRecordRegisterItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_rental_record_register_items, :accepted, :boolean
  end
end
