class Office::DemandItem < ApplicationRecord
	belongs_to :demand, class_name: "Office::Demand"
	belongs_to :item, class_name: "Office::Item"
end
