class ProjectPurchaseEntryItem < ApplicationRecord
  belongs_to :project_purchase_entry
  has_one :pneirt, dependent: :destroy
  has_one :peirt, dependent: :destroy

  before_create :prepare_data

  private

  def prepare_data
    @item = Item.find(self.item_id)
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.specification = @item.specification
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
    self.project_item_id = find_or_create_project_item_id
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

  def find_or_create_project_item_id
    project_items = ProjectItem.where(item_id: self.item_id)
    if project_items.blank?
      item = Item.find(self.item_id)
      project_item = ProjectItem.new
      project_item.name_of_item_en = item.name_of_item_en
      project_item.name_of_item_ne = item.name_of_item_ne
      project_item.item_classification_no = 52
      project_item.unit_en = item.unit_en
      project_item.unit_ne = item.unit_ne
      project_item.item_id = item.id
      project_item.user_id = self.user_id
      project_item.project_id = self.project_id
      project_item.fiscal_year_id = self.fiscal_year_id
      project_item.save
    else
      project_item = project_items.first
    end
    project_item.id
  end
end
