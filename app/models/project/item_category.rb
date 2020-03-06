class Project::ItemCategory < ApplicationRecord
  belongs_to :office_office, :class_name => 'Office::Office'
end
