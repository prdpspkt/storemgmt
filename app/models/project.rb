class Project < ApplicationRecord
  belongs_to :user
  has_many :project_items
  belongs_to :office
  has_many :project_demands
end
