class Office::PoolItem < ApplicationRecord
  belongs_to :item_category, :class_name => 'Office::ItemCategory'
end
