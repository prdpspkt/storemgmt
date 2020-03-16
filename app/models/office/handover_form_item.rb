class Office::HandoverFormItem < ApplicationRecord
  self.table_name = "office_handover_form_items"
  belongs_to :handover_form, class_name: "Office::HandoverForm"
  belongs_to :user
  belongs_to :office, class_name: "Office::Office"
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :item, class_name: "Office::Item"
  before_destroy :restore_item_transactions

  private
  def restore_item_transactions
    transaction = Office::ItemTransaction.find(self.subed_from)
    transaction.sku = transaction.sku + self.quantity
    transaction.save
  end


end
