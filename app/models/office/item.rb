class Office::Item < ApplicationRecord

  self.per_page = 30

  has_many :item_transactions, class_name: "Office::ItemTransaction"
  has_many :purchase_entry_items, :class_name => 'Office::PurchaseEntryItem'
  has_many :release_items, class_name: "Office::ReleaseItem"
  has_many :purchase_order_items, :class_name => 'Office::PurchaseOrderItem'
  belongs_to :item_category, :class_name => 'Office::ItemCategory'
  has_many :item_transaction, class_name: "Office::ItemTransaction"
  has_one :repair_record_register, :class_name => 'Office::RepairRecordRegister'
  belongs_to :user

  validates :item_category_id, numericality: true

  before_destroy :check_if_used


  private
  def check_if_used
    if_used = false
    if_used = true if self.purchase_order_items.count > 0
    if_used = true if self.purchase_entry_items.count > 0
    if_used = true if self.release_items.count > 0
    if_used = true if self.item_transactions.count > 0
    if if_used
      errors[:base] << "यो जिन्सी सामानसंग सम्बन्धित कारोबार अन्य दाखिला, खरिद आदेश, मागफरामहरू मध्ये कुनै एकमा देखिएकोले हटाउन सकिएन |"
      throw(:abort)
    end
  end

end
