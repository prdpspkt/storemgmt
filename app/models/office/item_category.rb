class Office::ItemCategory < ApplicationRecord
  has_many :items, class_name: "Office::Item"
end
