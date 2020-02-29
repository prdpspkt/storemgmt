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

end