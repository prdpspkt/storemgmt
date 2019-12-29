class Office < ApplicationRecord
	has_one :user
	has_many :fiscal_years
	has_one :active_fiscal_year
	has_many :store_bodies
end
