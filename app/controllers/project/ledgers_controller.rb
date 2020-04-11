class Project::LedgersController < ProjectController
  before_action :set_office_information

  def expense_item_registers
    @items = office(Project::Item)
                 .where(item_classification_no: 52)
                 .joins(:item_transactions)
                 .where("project_item_transactions.fiscal_year_id =#{current_fiscal_year.id}")
                 .distinct(:item_id)
    @report_name = "खर्च भएर जाने जिन्सी खाता"
    @form_no = 407
    @old_form_no = 52
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "खर्च भएर जाने जिन्सि खाता", layout: "pdf_print", orientation: "landscape"
      end
    end
  end

  def non_expense_item_registers
    @items = office(Project::Item)
                 .where(item_classification_no: 47)
                 .joins(:item_transactions)
                 .where("project_item_transactions.fiscal_year_id =#{current_fiscal_year.id}")
                 .distinct(:item_id)
    @report_name = "खर्च भएर नजाने (खप्ने मालसामानको) जिन्सी खाता"
    @form_no = 408
    @old_form_no = 47
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "खर्च भएर नजाने जिन्सि खाता", layout: "pdf_print", orientation: "landscape"
      end
    end
  end

  def expense_item_register
    @items = office(Project::ProjectItem).where(project_id: params[:id]).where(item_classification_no: 52)
    @project = Project::Project.find(params[:id])
    @report_name = "खर्च भएर जाने जिन्सी खाता"
    @form_no = 407
    @old_form_no = 52
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "खर्च भएर जाने जिन्सि खाता", layout: "pdf_print", orientation: "landscape"
      end
    end
  end

  def non_expense_item_register
    @items = office(Project::ProjectItem).where(project_id: params[:id]).where(item_classification_no: 47)
    @project = Project::Project.find(params[:id])
    @report_name = "खर्च भएर नजाने (खप्ने मालसामानको) जिन्सी खाता"
    @form_no = 408
    @old_form_no = 47
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "खर्च भएर नजाने जिन्सि खाता", layout: "pdf_print", orientation: "landscape"
      end
    end
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
