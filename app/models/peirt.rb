class Peirt < ApplicationRecord
  belongs_to :project_purchase_entry_item, optional: true
  belongs_to :project_tender_breakdown_item, optional: true
  before_destroy :reverse_entry_to_purchase_entry_item


  private
  def reverse_entry_to_purchase_entry_item
    if self.project_id.nil? && self.transaction_type == 1
      ppei = self.project_purchase_entry_item
      ppei.sku = project_purchase_entry_item.sku + self.quantity
      ppei.save
    end


  end
end
