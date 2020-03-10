class Office::DemandItem < ApplicationRecord
	self.table_name = "office_demand_items"
	belongs_to :demand, class_name: "Office::Demand"
	belongs_to :item, class_name: "Office::Item"
end
