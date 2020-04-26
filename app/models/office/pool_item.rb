class Office::PoolItem < ApplicationRecord
  belongs_to :item_category, :class_name => 'Office::ItemCategory'
  has_many :items, :class_name => 'Office::Item'

  before_destroy :check_if_used

private
  def check_if_used
    if_used = false
    if_used = true if self.items.count.positive?
    if if_used
         throw(:abort)
    end
  end
end
