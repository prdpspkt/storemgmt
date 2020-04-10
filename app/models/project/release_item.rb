class Project::ReleaseItem < ApplicationRecord
  belongs_to :release, class_name: "Project::Release"
  belongs_to :project_item, class_name: "Project::ProjectItem"
  belongs_to :item, class_name: "Project::Item"
  has_one :project_item_transaction, dependent: :destroy, class_name: "Project::ProjectItemTransaction", optional:  true
  belongs_to :item_transaction, :class_name => 'Project::ItemTransaction', optional: true
  before_destroy :restore_transactions

  private
  def restore_transactions
    transaction = self.item_transaction
    transaction.sku = transaction.sku + self.quantity
    transaction.save
  end
end
