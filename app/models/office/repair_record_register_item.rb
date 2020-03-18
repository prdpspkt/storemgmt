class Office::RepairRecordRegisterItem < ApplicationRecord
  self.table_name = "office_repair_record_register_items"
  belongs_to :repair_record_register, :class_name => 'Office::RepairRecordRegister'
end
