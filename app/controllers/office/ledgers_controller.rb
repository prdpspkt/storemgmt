class Office::LedgersController < OfficeController
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
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "office-expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
        else
          OfficeExpensableItemRegisterGenerator.perform_async(current_office.id, current_fiscal_year.id, current_control_body.id)
          redirect_to office_dashboard_url, notice: "Your file is being generated in background please try after few minutes."
        end
      end
    end
  end

  def print_pdf_expense_item_register
    @office = current_office
    @fiscal_year = current_fiscal_year
    OfficeExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id)
    redirect_to expense_item_register_office_ledgers_url, notice: "Your file is being generated in background please try print button after few minutes."
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
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "office-non-expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
        else
          OfficeNonExpensableItemRegisterGenerator.perform_async(current_office.id, current_fiscal_year.id, current_control_body.id)
          redirect_to office_dashboard_url, notice: "Your file is being generated in background please try after few minutes."
        end
      end
    end
  end
  def print_pdf_non_expense_item_register
    @office = current_office
    @fiscal_year = current_fiscal_year
    OfficeNonExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id)
    redirect_to non_expense_item_register_office_ledgers_url, notice: "Your file is being generated in background please try print button after few minutes."
  end
  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
