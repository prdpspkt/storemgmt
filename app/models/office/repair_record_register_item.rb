class Office::RepairRecordRegisterItem < ApplicationRecord
  belongs_to :repair_record_register, :class_name => 'Office::RepairRecordRegister'
  belongs_to :vendor, class_name: "Office::Vendor"
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  belongs_to :item, class_name: "Office::Item"
end
