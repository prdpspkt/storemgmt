class Office::RentalRecordRegister < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  has_many :rental_record_register_items, class_name: "Office::RentalRecordRegisterItem"
  belongs_to :item, :class_name => 'Office::Item'
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
end
