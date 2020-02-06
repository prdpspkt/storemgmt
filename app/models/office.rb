class Office < ApplicationRecord
	has_one :user
	has_many :fiscal_years
	has_one :active_fiscal_year
	has_many :store_bodies
	has_many :project_purchase_tenders
	has_many :project_tender_breakdowns
	has_many :projects
end
