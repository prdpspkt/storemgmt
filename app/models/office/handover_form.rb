class Office::HandoverForm < ApplicationRecord
  self.table_name = "office_handover_forms"
  has_many :handover_form_items,class_name: "Office::HandoverFormItem", :dependent => :destroy
  belongs_to :office, class_name: "Office::Office"
  belongs_to :store_body, class_name: "Office::StoreBody"
  private

 end
