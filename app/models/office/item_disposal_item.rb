class Office::ItemDisposalItem < ApplicationRecord
  belongs_to :office_item_disposal, :class_name => 'Office::ItemDisposal'
end
