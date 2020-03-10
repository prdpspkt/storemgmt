class Office::Release < ApplicationRecord
  self.table_name = "office_releases"
  has_many :release_items, class_name: "Office::ReleaseItem"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :store_body, class_name: "Office::StoreBody"

  private

end
