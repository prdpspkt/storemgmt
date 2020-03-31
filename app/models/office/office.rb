class Office::Office < ApplicationRecord
	has_one :user
	has_many :fiscal_years, :class_name => 'Office::FiscalYear'
	has_one :active_fiscal_year, :class_name => 'Office::ActiveFiscalYear'
	has_many :store_bodies, :class_name => 'Office::StoreBody'
	has_many :project_tenders, :class_name => 'Project::Tender'
	has_many :projects, :class_name => 'Project::Project'
	has_many :project_item_categories, :class_name => 'Project::ItemCategory'
end
