class AddOfficeChiefSignedDateToOfficeItemAssistanceRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :office_item_assistance_registers, :office_chief_signed_date, :datetime
  end
end
