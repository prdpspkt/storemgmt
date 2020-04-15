class Office::LandAndStructureRecordBook < ApplicationRecord
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  has_many :land_and_structure_record_book_items,  class_name: "Office::LandAndStructureRecordBookItem"
end
