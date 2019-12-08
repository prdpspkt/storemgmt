class Oneirt < ApplicationRecord
  belongs_to :office_item
  belongs_to :office_purchase_entry_item, optional: true
  belongs_to :office_release_item, optional: true
end
