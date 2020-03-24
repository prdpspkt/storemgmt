class Office::LedgersController < ApplicationController
before_action :set_office_information
  def expense_item_register
      @items = office(Office::Item).where(item_classification_no: 52).joins(:item_transactions).where("office_transactions.sku > 0").distinct(:item_id)
  end
  def non_expense_item_register
    @items = office(Office::Item).where(item_classification_no: 47).joins(:item_transactions).where("office_transactions.sku > 0").distinct(:item_id)
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
