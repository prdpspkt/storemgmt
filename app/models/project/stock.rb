class Project::Stock < ApplicationRecord
self.table_name = "project_stocks"
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :store_body, :class_name => 'Office::StoreBody'
  has_many :stock_items, :class_name => 'Project::StockItem', dependent: :destroy
end
