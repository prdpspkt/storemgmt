class Project::Release < ApplicationRecord
  has_many :release_items, class_name: "Project::ReleaseItem", dependent: :destry
  belongs_to :office, class_name: "Office::Office"
  belongs_to :project, class_name: "Project::Project"
  belongs_to :user
  belongs_to :demand, class_name: "Project::Demand"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :store_body, class_name: "Office::StoreBody"

  before_destroy :restore_demand
  private
  def restore_demand
    demand = self.demand
    if demand.blank? == false
      demand.entry_generated = false
      demand.save
  end
  end

end
