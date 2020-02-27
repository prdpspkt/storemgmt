class Office::Release < ApplicationRecord
  has_many :release_items, class_name: "Office::ReleaseItem"
  belongs_to :office, class_name: "Office::Office"
  belongs_to :user
  belongs_to :fiscal_year, class_name: "Office::FiscalYear"

  after_update :create_or_update_transactions

  private

  def create_or_update_transactions
    if self.marked_as_final == true
      items = self.office_release_items
      items.each do |ori|
          create_expensable_item_transaction ori
      end
    end
    if self.marked_as_final == false
      items = self.office_release_items
      items.each do |ori|
        if (ori.oeirt)
          ori.oeirt.destroy
        end
      end
    end
  end

  def create_expensable_item_transaction ori
    oeirt = Oeirt.find_or_create_by({office_release_item_id: ori.id})
    oeirt.update({
                     office_item_id: ori.office_item_id,
                     item_id: ori.item_id,
                     office_id: ori.office_id,
                     fiscal_year_id: ori.fiscal_year_id,
                     user_id: ori.user_id,
                     transaction_date: ori.office_release.release_date,
                     transaction_type: -1,
                     rate: ori.rate,
                     quantity: ori.quantity,
                     amount: ori.amount,
                     remarks: ori.remarks,
                     office_release_item_id: ori.id
                 })
    return oeirt
  end

end
