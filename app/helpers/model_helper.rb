module ModelHelper

  def office object
    object.where(office_id: current_office.id)
  end

  def current object
    object.where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id)
  end

end