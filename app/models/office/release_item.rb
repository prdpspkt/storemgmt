class Office::ReleaseItem < ApplicationRecord
  belongs_to :release, class_name: "Office::Release"
  belongs_to :item, class_name: "Office::Item"
  has_one :item_transaction, dependent: :destroy, class_name: "Office::ItemTransaction"
  belongs_to :user
  before_update :check_and_update_amount
  before_destroy :restore_transactions

  private
  def restore_transactions
    transaction = Office::ItemTransaction.find(self.subed_from)
    transaction.sku = transaction.sku + self.quantity
    transaction.save
  end

  def check_and_update_amount
    if self.rate_changed? || self.quantity_changed?
      self.amount = self.rate * self.quantity
    end
  end


end
