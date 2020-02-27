class Office::Item < ApplicationRecord
  self.table_name = "office_items"
  has_many :oeirt, class_name: "Office::Oeirt"
  has_many :oneirt, class_name: "Office::Oneirt"
  has_many :release_items, class_name: "Office::ReleaseItem"
  before_create :add_item_register_page_no
  validates :item_id, uniqueness: true
  validates :item_classification_no, numericality: true


  private

  def add_item_register_page_no
    if Office::Item.count > 0
      self.item_register_page_no = Office::Item.last.item_register_page_no + 1
    else
      self.item_register_page_no = 1
    end
  end
end
