class ProjectHandoverFormItem < ApplicationRecord
  has_one :pneirt, dependent: :destroy
  belongs_to :project_handover_form
  belongs_to :user
  belongs_to :project
  belongs_to :fiscal_year

  before_create :prepare_data
  before_destroy :reverse_pneirt_sku

  private

  def prepare_data
    @item = ProjectItem.find(self.project_item_id)
    self.item_register_page_no = @item.item_register_page_no
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
  end

  def reverse_pneirt_sku
    @pneirt = self.pneirt
    if (pneirt.blank? == false)
      @pneirt.sku = @pneirt.sku + self.quantity
      @pneirt.save
    end
  end

  def set_pneirt_id
    @pneirt_id = self.handovered_from
  end
end
