class Office::ReleaseItem < ApplicationRecord
  self.table_name = "office_release_items"
  belongs_to :release, class_name: "Office::Release"
  belongs_to :item, class_name: "Office::Item"
  has_one :item_transaction, dependent: :destroy, class_name: "Office::ItemTransaction"

end
