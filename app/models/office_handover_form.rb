class OfficeHandoverForm < ApplicationRecord
  has_many :office_handover_form_items, :dependent => :destroy
end
