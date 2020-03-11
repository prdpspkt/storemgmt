class Office::ItemTransaction < ApplicationRecord
  self.table_name = "office_transactions"
  belongs_to :item, class_name: "Office::Item"
  belongs_to :purchase_entry_item, class_name: "Office::PurchaseEntryItem", optional: true
  belongs_to :release_item, class_name: "Office::ReleaseItem", optional: true

  before_destroy :check_if_items_are_released

  private
  def check_if_items_are_released
    if transaction_type == 1
      if self.quantity > self.sku
      throw(:abort)
      end
    end
  end
end