class Project::ProjectPurchaseEntryItem < ApplicationRecord
  belongs_to :project_purchase_entry, :class_name => 'Project::ProjectPurchaseEntry'
  belongs_to :item, class_name: "Project::Item"
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :item_transaction, :class_name => 'Project::ItemTransaction'

  before_destroy :restore_purchase_entry_item
  before_update :check_and_update_amount

  private

  def restore_purchase_entry_item
    item_transaction = self.item_transaction
    if item_transaction.blank? == false
      item_transaction.sku =  item_transaction.sku + self.quantity
      item_transaction.save
    end
  end

  def check_and_update_amount
    if self.rate_changed? || self.quantity_changed?
      self.amount_without_vat = self.rate * self.quantity
      if self.is_vatable
        self.vat = self.amount_without_vat * 0.13
        self.amount = self.amount_without_vat * self.vat
      else
        self.amount = self.amount_without_vat
        self.vat = 0
      end
      self.total_amount = self.amount + self.other_expense
    end
    if self.other_expense_changed?
      self.total_amount = self.amount + self.other_expense
    end
  end
end
