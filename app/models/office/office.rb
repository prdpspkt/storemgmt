class Office::Office < ApplicationRecord
	has_one :user
	has_many :fiscal_years, :class_name => 'Office::FiscalYear'
	has_one :active_fiscal_year, :class_name => 'Office::ActiveFiscalYear'
	has_many :store_bodies, :class_name => 'Office::StoreBody'
	has_many :project_tenders, :class_name => 'Project::Tender'
	has_many :projects, :class_name => 'Project::Project'
	has_many :project_item_categories, :class_name => 'Project::ItemCategory'
	has_many :items, class_name: "Office::Item"
	has_many :purchase_orders, :class_name => 'Office::PurchaseOrder'
	has_many :purchase_entries, :class_name => 'Office::PurchaseEntry'
	has_many :tenders, :class_name => 'Office::Tender'
	has_many :demands, :class_name => 'Office::Demand'
	has_many :releases, :class_name => 'Office::Release'
	has_many :handover_forms, :class_name => 'Office::HandoverForm'
end
