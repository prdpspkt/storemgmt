class Office::ItemAssistanceRegister < ApplicationRecord
  self.table_name = "office_item_assistance_registers"
  has_many :item_assistance_register_items, class_name: "Office::ItemAssistanceRegister"
  belongs_to :personnel, class_name: "Office::Personnel"
end
