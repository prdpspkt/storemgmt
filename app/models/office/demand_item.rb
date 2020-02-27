class Office::DemandItem < ApplicationRecord
	belongs_to :demand, class_name: "Office::Demand"
end
