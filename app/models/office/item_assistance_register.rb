class Office::ItemAssistanceRegister < ApplicationRecord
  has_many :item_assistance_register_items, class_name: "Office::ItemAssistanceRegisterItem", dependent: :destroy
  belongs_to :personnel, class_name: "Office::Personnel"
end
