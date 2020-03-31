class Office::Release < ApplicationRecord
  has_many :release_items, class_name: "Office::ReleaseItem", dependent: :delete_all
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"
  belongs_to :store_body, class_name: "Office::StoreBody"

  before_destroy :restore_demand
  before_destroy :delete_and_restore_transactions
  private
  def restore_demand
    demand = Office::Demand.find(self.demand_id)
    demand.entry_generated = false
    demand.save
  end

  def delete_and_restore_transactions
    release_items = self.release_items
    release_items.each do |item|
      transaction_id = item.item_transaction_id

    end
  end

end
