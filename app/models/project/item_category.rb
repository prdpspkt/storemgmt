class Project::ItemCategory < ApplicationRecord
  belongs_to :office, :class_name => 'Office::Office'
end
