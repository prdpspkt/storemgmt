class Office::ItemDisposalItem < ApplicationRecord
  belongs_to :item_disposal, :class_name => 'Office::ItemDisposal'
  belongs_to :item, class_name: "Office::Item"
  belongs_to :item_transaction, class_name: "Office::ItemTransaction"
  belongs_to :user

  before_destroy :restore_transactions
  before_destroy :delete_new_item_transaction
  private
  def restore_transactions
    transaction = self.item_transaction
    transaction.sku = transaction.sku + self.quantity
    transaction.save
  end

  def delete_new_item_transaction
      new_transaction = Office::ItemTransaction.find(self.new_item_transaction_id)
      new_transaction.destroy
  end
end
