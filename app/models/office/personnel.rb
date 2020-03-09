class Office::Personnel < ApplicationRecord
  self.table_name = "office_personnels"
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
end
