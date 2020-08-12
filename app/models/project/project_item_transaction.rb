class Project::ProjectItemTransaction < ApplicationRecord
  belongs_to :item, class_name: "Project::Item"
  belongs_to :project_item, :class_name => 'Project::ProjectItem'
  belongs_to :project_purchase_entry_item, class_name: "Project::ProjectPurchaseEntryItem", optional: true
  belongs_to :release_item, class_name: "Project::ReleaseItem", optional: true
  belongs_to :office, class_name: "Office::Office"
  belongs_to :project, class_name: "Project::Project"
  belongs_to :user

  before_destroy :check_if_items_are_released
  before_update :check_and_update_amount

  private
  def check_if_items_are_released
    if transaction_type == 1
      if self.quantity > self.sku
      throw(:abort)
      end
    end
  end
  def check_and_update_amount
    if self.rate_changed? || self.quantity_changed?
      self.amount = self.rate * self.quantity
    end
  end
end