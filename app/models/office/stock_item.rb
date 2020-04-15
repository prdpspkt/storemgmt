class Office::StockItem < ApplicationRecord
  belongs_to :stock, :class_name => 'Office::Stock'
  belongs_to :item, :class_name => 'Office::Item'
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
end
