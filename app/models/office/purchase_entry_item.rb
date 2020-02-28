class Office::PurchaseEntryItem < ApplicationRecord
  self.table_name = "office_purchase_entry_items"
  belongs_to :purchase_entry, class_name: "Office::PurchaseEntry"
  has_one :oneirt, dependent: :destroy, class_name: "Office::Oneirt"
  has_one :oeirt, dependent: :destroy, class_name: "Office::Oeirt"

  before_create :prepare_data

  private

  def prepare_data
    @item = Office::Item.find(self.office_item_id)
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.specification = @item.specification
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
    self.amount_without_vat = self.rate * self.quantity
    if self.is_vatable
      self.vat = self.amount_without_vat * 0.13
      self.amount = self.amount_without_vat + self.vat
    else
      self.amount = self.amount_without_vat
    end
    if self.other_expense.present?
      self.total_amount = self.amount + self.other_expense
    else
      self.total_amount = self.amount
    end
  end
end
