class Office::LedgersController < ApplicationController
before_action :set_office_information
  def expense_item_register
      @items = office(Office::Item).where(item_classification_no: 52)
      @office = current_office
      @fiscal_year = current_fiscal_year
      @report_name = "खर्च भएर जाने जिन्सी सामानको खाता"
      @form_no = 407
      @old_form_no = 52

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'expensable_item_register', layout: 'pdf_print', orientation: "landscape"
        end
      end
  end
  def non_expense_item_register
    @items = office(Office::Item).where(item_classification_no: 47)
    @office = current_office
    @fiscal_year = current_fiscal_year
    @report_name = "खर्च भएर नजाने (खप्ने) जिन्सी सामानको खाता"
    @form_no = 408
    @old_form_no = 47

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'non_expensable_item_register', layout: 'pdf_print', orientation: "landscape"
      end
    end
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
