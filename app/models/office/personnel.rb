class Office::Personnel < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
end
