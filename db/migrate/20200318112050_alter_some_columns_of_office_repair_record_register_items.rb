class AlterSomeColumnsOfOfficeRepairRecordRegisterItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :office_repair_record_register_items, :vendor_name
    add_column :office_repair_record_register_items, :vendor_id, :integer
  end
end
