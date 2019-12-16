class ProjectRelease < ApplicationRecord
  has_many :project_release_items
  belongs_to :project
  belongs_to :user
  belongs_to :fiscal_year

  after_update :create_or_update_transactions

  private

  def create_or_update_transactions
    if self.marked_as_final == true
      items = self.project_release_items
      items.each do |pri|
          create_expensable_item_transaction pri
      end
    end
    if self.marked_as_final == false
      items = self.project_release_items
      items.each do |pri|
        if (pri.peirt)
          pri.peirt.destroy
        end
      end
    end
  end

  def create_expensable_item_transaction pri
    peirt = Peirt.find_or_create_by({project_release_item_id: pri.id})
    peirt.update({
                     project_item_id: pri.project_item_id,
                     item_id: pri.item_id,
                     project_id: pri.project_id,
                     fiscal_year_id: pri.fiscal_year_id,
                     user_id: pri.user_id,
                     transaction_date: pri.project_release.release_date,
                     transaction_type: -1,
                     rate: pri.rate,
                     quantity: pri.quantity,
                     amount: pri.amount,
                     remarks: pri.remarks,
                     project_release_item_id: pri.id
                 })
    return peirt
  end

end
