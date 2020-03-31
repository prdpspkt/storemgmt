class Project::ProjectPurchaseEntryItem < ApplicationRecord
  belongs_to :project_purchase_entry, :class_name => 'Project::ProjectPurchaseEntry'
  belongs_to :item, class_name: "Project::Item"
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :item_transaction, :class_name => 'Project::ItemTransaction'

  before_destroy :restore_purchase_entry_item

  private

  def restore_purchase_entry_item
    item_transaction = self.item_transaction
    if item_transaction.blank? == false
      item_transaction.sku = self.quantity + item_transaction.sku
      item_transaction.save
    end
  end
end
