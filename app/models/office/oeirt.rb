class Office::Oeirt < ApplicationRecord
  belongs_to :item, class_name: "Office::Item"
  belongs_to :purchase_entry_item, class_name: "Office::PurchaseEntryItem", optional: true
  belongs_to :release_item, class_name: "Office::ReleaseItem",optional: true
end