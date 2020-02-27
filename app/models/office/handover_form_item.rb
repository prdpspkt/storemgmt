class Office::HandoverFormItem < ApplicationRecord
  has_one :oneirt, dependent: :destroy, class_name: "Office::Oneirt"
  belongs_to :handover_form, class_name: "Office::HandoverForm"
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"

  before_create :prepare_data
  before_destroy :reverse_oneirt_sku

  private

  def prepare_data
    @item = Office::Item.find(self.office_item_id)
    self.item_register_page_no = @item.item_register_page_no
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
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
