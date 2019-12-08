class OfficeItem < ApplicationRecord
  belongs_to :item
  has_many :oeirt
  has_many :oneirt
  has_many :office_release_items
  before_create :add_item_register_page_no
  validates :item_id, uniqueness: true
  validates :item_classification_no, numericality: true



  private

  def add_item_register_page_no
    if OfficeItem.count > 0
      self.item_register_page_no = OfficeItem.last.item_register_page_no + 1
    else
      self.item_register_page_no = 1
    end
  end
end
