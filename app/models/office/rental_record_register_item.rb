class Office::RentalRecordRegisterItem < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  belongs_to :rental_record_register, class_name: "Office::RentalRecordRegister"
end
