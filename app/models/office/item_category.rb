class Office::ItemCategory < ApplicationRecord
  self.table_name = "office_item_categories"
  has_many :items, class_name: "Office::Item"
end
