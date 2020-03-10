class Office::ReleaseItem < ApplicationRecord
  self.table_name = "office_release_items"
  belongs_to :release, class_name: "Office::Release"
  belongs_to :item, class_name: "Office::Item"
  has_one :item_transaction, dependent: :destroy, class_name: "Office::ItemTransaction"
  before_destroy :restore_transactions

  private
  def restore_transactions
    transaction = Office::ItemTransaction.find(self.item_transaction_id)
    transaction.sku = transaction.sku + self.quantity
    transaction.save
  end
end
