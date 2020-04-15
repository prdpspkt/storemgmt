class Office::Release < ApplicationRecord
  has_many :release_items, class_name: "Office::ReleaseItem", dependent: :destroy
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to :demand, :class_name => 'Office::Demand'


  before_destroy :restore_demand

  private

  def restore_demand
    demand = self.demand
    demand.entry_generated = false
    demand.save
  end
end
