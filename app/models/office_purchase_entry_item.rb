class OfficePurchaseEntryItem < ApplicationRecord
  belongs_to :office_purchase_entry
  has_one :oneirt, dependent: :destroy
  has_one :oeirt, dependent: :destroy

  before_create :prepare_data

  private

  def prepare_data
    @item = Item.find(self.item_id)
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.specification = @item.specification
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
    self.office_item_id = find_or_create_office_item_id
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

  def find_or_create_office_item_id
    office_items = OfficeItem.where(item_id: self.item_id)
    if office_items.blank?
      item = Item.find(self.item_id)
      office_item = OfficeItem.new
      office_item.name_of_item_en = item.name_of_item_en
      office_item.name_of_item_ne = item.name_of_item_ne
      office_item.item_classification_no = 52
      office_item.unit_en = item.unit_en
      office_item.unit_ne = item.unit_ne
      office_item.item_id = item.id
      office_item.user_id = self.user_id
      office_item.office_id = self.office_id
      office_item.fiscal_year_id = self.fiscal_year_id
      office_item.save
    else
      office_item = office_items.first
    end
    office_item.id
  end
end
