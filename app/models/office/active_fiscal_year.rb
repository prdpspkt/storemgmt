class Office::ActiveFiscalYear < ApplicationRecord
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
end
