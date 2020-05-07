class Office::LedgersController < OfficeController
  before_action :set_office_information

  def expense_item_register
    @generate_url = print_pdf_expense_item_register_office_ledgers_url
    @download_url =  download_pdf_expense_item_register_office_ledgers_url(format: :pdf)
    @report_name = "खर्च भएर जाने जिन्सी खाता"
    @eitems = current(Office::Item).where(item_classification_no: 52)
    render 'index'
  end

  def print_pdf_expense_item_register
    @office = current_office
    @fiscal_year = current_fiscal_year
    OfficeExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id)
  end

  def download_pdf_expense_item_register
    respond_to do |format|
    format.pdf do
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "office-expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
       end
      end
    end
  end


  def non_expense_item_register
    @generate_url = print_pdf_non_expense_item_register_office_ledgers_url
    @download_url = download_pdf_non_expense_item_register_office_ledgers_url(format: :pdf)
    @report_name = "खर्च भएर नजाने(खप्ने) जिन्सी खाता"
    @nitems = office(Office::Item).where(item_classification_no: 47)
    render 'index'
  end

  def print_pdf_non_expense_item_register
    @office = current_office
    @fiscal_year = current_fiscal_year
    OfficeNonExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id)
  end


  def download_pdf_non_expense_item_register
    respond_to do |format|
    format.html { redirect_to non_expense_item_register_office_ledgers_url, notice: "Please press download button."}
    format.pdf do
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "office-non-expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
      end
      end
    end
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
