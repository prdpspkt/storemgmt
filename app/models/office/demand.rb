class Office::Demand < ApplicationRecord
	has_many :demand_items, class_name: "Office::DemandItem", dependent: :destroy
	belongs_to :office, :class_name => 'Office::Office'
	belongs_to :store_body, :class_name => 'Office::StoreBody'
	belongs_to :user
	belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
	belongs_to :personnel, :class_name => 'Office::Personnel'
end
