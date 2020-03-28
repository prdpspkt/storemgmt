class Project::LedgersController < ProjectController
  before_action :set_office_information

  def expense_item_registers
    @items = office(Project::Item).where(item_classification_no: 52).joins(:item_transactions).where("project_transactions.sku > 0").distinct(:item_id)
  end

  def non_expense_item_registers
    @items = office(Project::Item).where(item_classification_no: 47).joins(:item_transactions).where("project_transactions.sku > 0").distinct(:item_id)
  end

  def expense_item_register
    @items = Project::ProjectItem.where(project_id: params[:id]).where(item_classification_no: 52)
  end

  def non_expense_item_register
    @items = Project::ProjectItem.where(project_id: params[:id]).where(item_classification_no: 47)
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end
end
