class ProjectItem < ApplicationRecord
	belongs_to :project, optional: :true
	belongs_to :item
	has_many :peirts
	has_many :pneirts


end
