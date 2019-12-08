class OfficePurchaseEntry < ApplicationRecord
  has_many :office_purchase_entry_items, dependent: :delete_all
  belongs_to :user
  belongs_to :office
  belongs_to :fiscal_year


  after_update :create_or_update_transactions


  private

  def create_or_update_transactions
    if self.marked_as_final == true
      items = self.office_purchase_entry_items
      items.each do |opei|
        if opei.item_classification_no == 47
          create_non_expensable_item_transaction opei
        end
        if opei.item_classification_no == 52
          create_expensable_item_transaction opei
        end
      end
    end
    if self.marked_as_final == false
      items = self.office_purchase_entry_items
      items.each do |opei|
        if (opei.oeirt)
          opei.oeirt.destroy
        end
        if opei.oneirt
          opei.oneirt.destroy
        end
      end
    end
  end

  def create_expensable_item_transaction opei
    oeirt = Oeirt.find_or_create_by({office_purchase_entry_item_id: opei.id})
    oeirt.update({
                     office_item_id: opei.office_item_id,
                     item_id: opei.item_id,
                     office_id: opei.office_id,
                     fiscal_year_id: opei.fiscal_year_id,
                     user_id: opei.user_id,
                     transaction_date: opei.office_purchase_entry.entry_date,
                     transaction_type: 1,
                     rate: (opei.total_amount / opei.quantity),
                     quantity: opei.quantity,
                     amount: opei.total_amount,
                     sku: opei.quantity,
                     remarks: opei.remarks
                 })
    return oeirt
  end

  def create_non_expensable_item_transaction opei
    obj = Oneirt.find_or_create_by({office_purchase_entry_item_id: opei.id})
    obj.update({
                   office_item_id: opei.office_item_id,
                   item_id: opei.item_id,
                   item_identification_no: opei.item_identification_no,
                   model: opei.model_no,
                   country: opei.country,
                   size: opei.size,
                   entry_no: opei.office_purchase_entry.entry_no,
                   approx_age: opei.approx_age,
                   source: opei.source,
                   office_id: opei.office_id,
                   fiscal_year_id: opei.fiscal_year_id,
                   user_id: opei.user_id,
                   transaction_date: opei.office_purchase_entry.entry_date,
                   transaction_type: 1,
                   rate: (opei.total_amount / opei.quantity),
                   quantity: opei.quantity,
                   amount: opei.total_amount,
                   sku: opei.quantity,
                   remarks: opei.remarks
               })
    return obj
  end

end
