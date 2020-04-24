class ChangeSomeColumnsInRepairApplicationForm < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_repair_application_form_items, :applicant_sign
    add_column :office_repair_application_form_items, :personnel_id, :integer
  end
end
