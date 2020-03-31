class Office::RepairRecordRegisterItem < ApplicationRecord
  belongs_to :repair_record_register, :class_name => 'Office::RepairRecordRegister'
  belongs_to :vendor, class_name: "Office::Vendor"
end
