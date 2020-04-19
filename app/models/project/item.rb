class Project::Item < ApplicationRecord
  belongs_to :office, :class_name => 'Office::Office'
  belongs_to :user
  belongs_to :item_category, class_name: "Project::ItemCategory"
  has_many :item_transactions, class_name: "Project::ItemTransaction"
  has_many :tender_items, :class_name => 'Project::TenderItem'
  has_many :project_item_transactions, :class_name => 'Project::ProjectItemTransaction'
  has_many :purchase_order_items, :class_name => 'Project::PurchaseOrderItem'
  has_many :purchase_entry_items, :class_name => 'Project::PurchaseEntryItem'
  has_many :release_items, :class_name => 'Project::ReleaseItem'

  before_destroy :check_if_used


  private
  def check_if_used
    if_used = false
    if_used = true if self.purchase_order_items.count > 0
    if_used = true if self.purchase_entry_items.count > 0
    if_used = true if self.release_items.count > 0
    if_used = true if self.item_transactions.count > 0
    if_used = true if self.project_item_transactions.count > 0
    if if_used
      errors[:base] << "यो जिन्सी सामानसंग सम्बन्धित कारोबार अन्य दाखिला, खरिद आदेश, मागफरामहरू मध्ये कुनै एकमा देखिएकोले हटाउन सकिएन |"
      throw(:abort)
    end
  end

end
