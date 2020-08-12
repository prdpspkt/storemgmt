class Project::PurchaseEntryItem < ApplicationRecord
  belongs_to :purchase_entry, class_name: "Project::PurchaseEntry"
  belongs_to :item, :class_name => 'Project::Item'
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user

  before_update :check_and_update_amount


  private

  def check_and_update_amount
    if self.rate_changed? || self.quantity_changed?
      self.amount_without_vat = self.rate * self.quantity
      self.vat = self.amount_without_vat * 0.13
      self.amount = self.amount_without_vat * self.vat
      self.total_amount = self.amount + self.other_expense
    end
    if self.other_expense_changed?
      self.total_amount = self.amount + self.other_expense
    end
  end
end