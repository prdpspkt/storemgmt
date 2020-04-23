class Office::DemandItem < ApplicationRecord
	belongs_to :demand, class_name: "Office::Demand"
	belongs_to :item, class_name: "Office::Item"
	belongs_to :item_transaction, :class_name => 'Office::ItemTransaction', optional: true
	belongs_to :user
end
