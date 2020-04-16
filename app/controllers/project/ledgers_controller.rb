class Project::LedgersController < ProjectController
  before_action :set_office_information

  def expense_item_register
    @generate_url = print_pdf_expense_item_register_project_ledgers_url
    @download_url =  download_pdf_expense_item_register_project_ledgers_url(format: :pdf)
    @report_name = "खर्च भएर जाने जिन्सी खाता"
    render 'index'
  end

  def print_pdf_expense_item_register
    ProjectExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id)
    redirect_to expense_item_register_project_ledgers_url, notice: "Your file is being generated in background please try print button after few minutes."
  end

  def download_pdf_expense_item_register
    respond_to do |format|
    format.pdf do
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "project-expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
       end
      end
    end
  end


  def non_expense_item_register
    @generate_url = print_pdf_non_expense_item_register_project_ledgers_url
    @download_url = download_pdf_non_expense_item_register_project_ledgers_url(format: :pdf)
    @report_name = "खर्च भएर नजाने(खप्ने) जिन्सी खाता"
    render 'index'
  end

  def print_pdf_non_expense_item_register
    ProjectNonExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id)
    redirect_to non_expense_item_register_project_ledgers_url, notice: "Your file is being generated in background please try download button after few minutes."
  end


  def download_pdf_non_expense_item_register
    respond_to do |format|
    format.html { redirect_to non_expense_item_register_project_ledgers_url, notice: "Please press download button."}
    format.pdf do
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "project-non-expensable-item-register.pdf")
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
