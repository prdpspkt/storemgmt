class RemoveSomeColumnsFromOfficeRepairApplicationForms < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_repair_application_forms, :vendor_address
    remove_column :office_repair_application_forms, :vendor_name
    remove_column :office_repair_application_forms, :vendor_phone
    remove_column :office_repair_application_forms, :vendor_registration_no
    remove_column :office_repair_application_forms, :vendor_pan
    add_column :office_repair_application_forms, :vendor_id, :integer
  end
end
