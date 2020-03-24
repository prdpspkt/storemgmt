module ModelHelper

  def office object
    object.where(office_id: current_office.id)
  end

  def current object
    object.where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id)
  end




  def set_office_item_information item_id, object
    @office_item = Office::Item.find(item_id)
    @office_item.attributes.each do |key, value|
      if object.attributes.include? key
        object.key = value
      end
    end
    object.id = nil
    object.office_item_id = @office_item.id
    object
  end

  def can_unmark_purchase_entry purchase_entry
    can_unmark = true
    items = purchase_entry.purchase_entry_items
    items.each do |item|
      if item.item_transaction.quantity < item.item_transaction.sku
        can_unmark = false
      end
    end
    can_unmark
  end

  def office_item_transactions_with_stock item_id
    @transactions = current(Office::ItemTransaction).where(item_id: item_id).where(item_classification_no: 52).where("sku > 0")
  end

  def get_last_repair_record rafi
    lrr = false
    rrris = Office::RepairRecordRegisterItem.where(user_id: rafi.user_id)
        .where(office_id: rafi.office_id)
        .where(fiscal_year_id: rafi.fiscal_year_id)
        .where(item_id: rafi.item_id)
       if rrris.count > 0
      lrr = rrris.last
    end
    lrr
  end

  def get_current_repair_count rafi
    crc = false
    rrris = Office::RepairRecordRegisterItem.where(user_id: rafi.user_id)
        .where(office_id: rafi.office_id)
        .where(fiscal_year_id: rafi.fiscal_year_id)
        .where(item_id: rafi.item_id)
    if rrris.count > 0
        crc = rrris.count
    end
    crc
  end

  def get_current_repair_cost rafi
    crc = false
    rrris = Office::RepairRecordRegisterItem.where(user_id: rafi.user_id)
                .where(office_id: rafi.office_id)
                .where(fiscal_year_id: rafi.fiscal_year_id)
                .where(item_id: rafi.item_id)
    if rrris.count > 0
      crc = rrris.sum(:total_expense)
    end
    crc
  end
end