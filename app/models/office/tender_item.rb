class Office::TenderItem < ApplicationRecord
  belongs_to :tender, class_name: "Office::Tender"
  belongs_to :item, :class_name => 'Office::Item'
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user

end
