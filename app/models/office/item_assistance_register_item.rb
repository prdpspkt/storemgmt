class Office::ItemAssistanceRegisterItem < ApplicationRecord
  belongs_to :item_assistance_register, class_name: "Office::ItemAssistanceRegister"
end
