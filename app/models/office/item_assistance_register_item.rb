class Office::ItemAssistanceRegisterItem < ApplicationRecord
  belongs_to :item_assistance_register, class_name: "Office::ItemAssistanceRegister"
  belongs_to :item_transaction, class_name: "Office::ItemTransaction"
  belongs_to :item, class_name: "Office::Item"
  before_destroy :restore_item_transaction
  belongs_to :user

  private
  def restore_item_transaction
    it = self.item_transaction
    it.in_use = false
    it.save
  end
end
