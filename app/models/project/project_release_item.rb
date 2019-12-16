class ProjectReleaseItem < ApplicationRecord
  belongs_to :project_release
  belongs_to :project_item
  has_one :peirt, dependent: :destroy

  before_create :prepare_data
  before_destroy :delete_peirt

  private
  def prepare_data
    @item = Item.find(self.item_id)
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.specification = @item.specification
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
  end

  def delete_peirt
    released_form = Peirt.find(self.released_from)
    released_form.sku = released_form.sku + @project_release_item.quantity
    released_form.save
  end
end
