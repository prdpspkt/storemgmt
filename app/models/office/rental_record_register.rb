class Office::RentalRecordRegister < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  has_many: :rental_record_register_items, class_name: "Office::RentalRecordRegisterItem"
end
