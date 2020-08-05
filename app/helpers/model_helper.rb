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


  def office_item_transactions_with_stock item_id
    @transactions = current(Office::ItemTransaction).where(item_id: item_id).where("sku > 0")
  end

  def get_last_repair_record rafi
    lrr = false
    rrris = Office::RepairRecordRegisterItem.where(user_id: rafi.user_id)
                .where(office_id: rafi.office_id)
                .where(fiscal_year_id: rafi.fiscal_year_id)
                .where(item_id: rafi.item_id)
                .where("date < '#{rafi.repair_application_form.date}'")
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
                .where("date < '#{rafi.repair_application_form.date}'")
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
                .where("date < '#{rafi.repair_application_form.date}'")
    if rrris.count > 0
      crc = rrris.sum(:total_expense)
    end
    crc
  end

  def short_bs_date date
    date.strftime("%Y-%m-%d")
  end


  def get_project_item_quantity office_id, fiscal_year_id, project_item_id, item_classification_no
    Project::ProjectItemTransaction.where(office_id: office_id)
        .where(fiscal_year_id: fiscal_year_id)
        .where(project_item_id: project_item_id)
        .where(item_classification_no: item_classification_no)
        .where("sku > 0").sum(:sku)
  end

  def get_project_project_item_transactions project_item, fiscal_year
    Project::ProjectItemTransaction.where(project_item_id: project_item.id)
        .where(office_id: project_item.office_id)
        .where(project_id: project_item.project_id)
        .where(fiscal_year_id: fiscal_year.id)
        .where(item_id: project_item.item_id)
  end

  def get_office_item_transactions item, fiscal_year
    Office::ItemTransaction.where(item_id: item.id)
        .where(office_id: item.office_id)
        .where(fiscal_year_id: fiscal_year.id)
  end

  def get_project_item_transactions item, fiscal_year
    Project::ItemTransaction.where(item_id: item.id)
        .where(office_id: item.office_id)
        .where(fiscal_year_id: fiscal_year.id)
        .order("id asc")
  end
end