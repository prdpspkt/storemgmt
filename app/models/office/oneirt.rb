class Office::Oneirt < ApplicationRecord
  belongs_to :item, class_name: "Office::Item"
  belongs_to :office_purchase_entry_item, optional: true
  belongs_to :office_release_item, optional: true
  belongs_to :office_handover_form_item, optional: true
end
