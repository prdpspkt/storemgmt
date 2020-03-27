class Project::ProjectItemTransaction < ApplicationRecord
  self.table_name = "project_project_transactions"
  belongs_to :item, class_name: "Project::Item"
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :project_purchase_entry_item, class_name: "Project::ProjectPurchaseEntryItem", optional: true
  belongs_to :release_item, class_name: "Project::ReleaseItem", optional: true
  belongs_to :office, class_name: "Office::Office"

  before_destroy :check_if_items_are_released

  private
  def check_if_items_are_released
    if transaction_type == 1
      if self.quantity > self.sku
      throw(:abort)
      end
    end
  end
end