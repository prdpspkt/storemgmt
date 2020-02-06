class ProjectItem < ApplicationRecord
	belongs_to :project, optional: :true
	belongs_to :item
end
