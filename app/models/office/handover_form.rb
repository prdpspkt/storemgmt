class Office::HandoverForm < ApplicationRecord
  has_many :handover_form_items,class_name: "Office::HandoverFormItem", :dependent => :destroy
  belongs_to :office, class_name: "Office::Office"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to :fiscal_year, :class_name => 'Office::FiscalYear'
  belongs_to :user
  private

 end
