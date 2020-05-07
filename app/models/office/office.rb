class Office::Office < ApplicationRecord
	has_one :user
	has_many :fiscal_years, :class_name => 'Office::FiscalYear', dependent: :destroy
	has_one :active_fiscal_year, :class_name => 'Office::ActiveFiscalYear', dependent: :destroy
	has_many :store_bodies, :class_name => 'Office::StoreBody', dependent: :destroy
	has_many :project_tenders, :class_name => 'Project::Tender', dependent: :destroy
	has_many :projects, :class_name => 'Project::Project', dependent: :destroy
	has_many :project_item_categories, :class_name => 'Project::ItemCategory', dependent: :destroy
	has_many :items, class_name: "Office::Item", dependent: :destroy
	has_many :purchase_orders, :class_name => 'Office::PurchaseOrder', dependent: :destroy
	has_many :purchase_entries, :class_name => 'Office::PurchaseEntry', dependent: :destroy
	has_many :tenders, :class_name => 'Office::Tender', dependent: :destroy
	has_many :demands, :class_name => 'Office::Demand', dependent: :destroy
	has_many :releases, :class_name => 'Office::Release', dependent: :destroy
	has_many :handover_forms, :class_name => 'Office::HandoverForm', dependent: :destroy

	before_create :check_office

	private

	def check_office
		user = User.find(self.user_id)
		unless user.office.blank?
			errors[:base] << "You already have an office created. You cannot create more than one."
			setup = user.setup
			setup.office = true
			user.save!
			throw(:abort)
		end
	end
end
