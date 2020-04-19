class Project::ItemCategory < ApplicationRecord
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :user
  has_many :items, :class_name => 'Project::Item'
end
