class Project::ItemTransaction < ApplicationRecord
  belongs_to :item, class_name: "Project::Item"
  belongs_to :purchase_entry_item, class_name: "Project::PurchaseEntryItem", optional: true
  belongs_to :release_item, class_name: "Project::ReleaseItem", optional: true
  belongs_to :office, class_name: "Office::Office"

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