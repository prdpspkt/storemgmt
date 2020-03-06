class Office::Oneirt < ApplicationRecord
  belongs_to :item, class_name: "Office::Item"
  belongs_to :purchase_entry_item, optional: true, class_name: "Office::PurchaseEntryItem"
  belongs_to :release_item, optional: true, class_name: "Office::ReleaseItem"
  belongs_to :handover_form_item, optional: true, class_name: "Office::HandoverFormItem"
end
