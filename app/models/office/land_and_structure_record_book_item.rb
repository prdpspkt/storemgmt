class Office::LandAndStructureRecordBookItem < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name "Office::Office"
  belongs_to :land_and_structure_record_book, class_name: "Office::LandAndStructureRecordBook"
end
