class Office::Demand < ApplicationRecord
	has_many :demand_items, class_name: "Office::DemandItem", dependent: :destroy
end
