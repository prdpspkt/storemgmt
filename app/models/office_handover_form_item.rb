class OfficeHandoverFormItem < ApplicationRecord
  has_one :oneirt, dependent: :destroy
  belongs_to :office_handover_form
  belongs_to :user
  belongs_to :office
  belongs_to :fiscal_year

  before_create :prepare_data
  before_destroy :reverse_oneirt_sku

  private

  def prepare_data
    @item = OfficeItem.find(self.office_item_id)
    self.item_identification_no = @item.item_identification_no
    self.item_classification_no = @item.item_classification_no
    self.item_register_page_no = @item.item_register_page_no
    self.model_no = @item.model_no
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.specification = @item.specification
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
  end

  def reverse_oneirt_sku
    @oneirt = self.oneirt
    if (oneirt.blank? == false)
      @oneirt.sku = @oneirt.sku + self.quantity
      @oneirt.save
    end
  end

  def set_oneirt_id
    @oneirt_id = self.handovered_from
  end
end
