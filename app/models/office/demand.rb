class Office::Demand < ApplicationRecord
	self.table_name = "office_demands"

	has_many :demand_items, class_name: "Office::DemandItem"
end
