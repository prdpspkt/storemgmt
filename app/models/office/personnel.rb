class Office::Personnel < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  has_one :item_assistance_register, class_name: 'Office::ItemAssistanceRegister'
end
