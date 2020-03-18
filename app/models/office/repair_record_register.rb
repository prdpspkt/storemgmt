class Office::RepairRecordRegister < ApplicationRecord
  self.table_name = "office_repair_record_registers"
  belongs_to :item, class_name: "Office::Item"
  belongs_to :store_body, class_name: "Office::StoreBody"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :item_transaction, class_name: "Office::ItemTransaction"
  has_many :repair_record_register_items, :class_name => 'Office::RepairRecordRegisterItem'
end
