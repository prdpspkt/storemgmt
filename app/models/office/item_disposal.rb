class Office::ItemDisposal < ApplicationRecord
  has_many :item_disposal_items, class_name: "Office::ItemDisposalItem"
end
