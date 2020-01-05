class Item < ApplicationRecord
  has_many  :office_items
  validates :name_of_item_ne, presence: true
  validates :name_of_item_en, presence: true
  validates :unit_ne, presence: true
  validates :unit_en, presence: true
  validates :item_category_id, presence: true, numericality: true

end
