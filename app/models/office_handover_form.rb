class OfficeHandoverForm < ApplicationRecord
  has_many :office_handover_form_items, :dependent => :destroy

  after_update :create_or_update_transactions

  private

  def create_or_update_transactions
    if self.marked_as_final == true
      items = self.office_handover_form_items
      items.each do |ohfi|
        create_nonexpensable_item_transaction ohfi
      end
    end
    if self.marked_as_final == false
      items = self.office_handover_form_items
      items.each do |ohfi|
        if (ohfi.oneirt)
          ohfi.oneirt.destroy
        end
      end
    end
  end

  def create_nonexpensable_item_transaction ohfi
    oeirt = Oneirt.find_or_create_by({office_handover_form_item_id: ohfi.id})
    oeirt.update({
                     office_item_id: ohfi.office_item_id,
                     item_id: ohfi.item_id,
                     office_id: ohfi.office_id,
                     fiscal_year_id: ohfi.fiscal_year_id,
                     user_id: ohfi.user_id,
                     transaction_date: ohfi.office_handover_form.date,
                     transaction_type: -1,
                     item_identification_no: ohfi.item_identification_no,
                     model: ohfi.model_no,
                     approx_age: ohfi.age_approx,
                     size: ohfi.size,
                     country: ohfi.country,
                     quantity: ohfi.quantity,
                     amount: ohfi.amount,
                     office_handover_form_item_id: ohfi.id
                 })
    return oeirt
  end
end
