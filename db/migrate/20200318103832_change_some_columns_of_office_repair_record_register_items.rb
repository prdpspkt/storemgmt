class ChangeSomeColumnsOfOfficeRepairRecordRegisterItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :office_repair_record_register_items, :applicat_name, :applicant_name
    rename_column :office_repair_record_register_items, :changesd_part_cost, :changed_part_cost
    add_column :office_repair_record_register_items, :item_id, :integer
  end
end
