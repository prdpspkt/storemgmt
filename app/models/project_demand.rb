class ProjectDemand < ApplicationRecord
  belongs_to :project
  has_many :project_demand_items
end
