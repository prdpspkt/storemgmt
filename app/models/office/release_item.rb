class Office::ReleaseItem < ApplicationRecord
  belongs_to :release, class_name: "Office::Release"
  belongs_to :item, class_name: "Office::Item"
  has_one :oeirt, dependent: :destroy, class_name: "Office::Oeirt"

  before_create :prepare_data
  before_destroy :delete_oeirt

  private
  def prepare_data
    @item = Office::Item.find(self.item_id)
    self.name_of_item_ne = @item.name_of_item_ne
    self.name_of_item_en = @item.name_of_item_en
    self.specification = @item.specification
    self.unit_ne = @item.unit_ne
    self.unit_en = @item.unit_en
  end

  def delete_oeirt
    released_form = Office::Oeirt.find(self.released_from)
    released_form.sku = released_form.sku + @office_release_item.quantity
    released_form.save
  end
end
