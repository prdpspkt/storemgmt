class Project::ReleaseItem < ApplicationRecord
  self.table_name = "project_release_items"
  belongs_to :release, class_name: "Project::Release"
  belongs_to :project_item, class_name: "Project::ProjectItem"
  belongs_to :item, class_name: "Project::Item"
  has_one :project_item_transaction, dependent: :destroy, class_name: "Project::ProjectItemTransaction"
  before_destroy :restore_transactions

  private
  def restore_transactions
    transaction = Project::ProjectItemTransaction.find(self.subed_from)
    transaction.sku = transaction.sku + self.quantity
    transaction.save
  end
end
