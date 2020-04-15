class Office::PurchaseEntryItem < ApplicationRecord
  belongs_to :purchase_entry, class_name: "Office::PurchaseEntry"
  has_one :item_transaction, class_name: "Office::ItemTransaction", dependent: :destroy
  belongs_to :item, class_name: "Office::Item"
  belongs_to :user

  before_destroy :check_expense_transactions

  private
  def check_expense_transactions
   throw(:abort)  if self.item_transaction.blank? == false
  end

end
