class Project::ReportController < ProjectController
  before_action :set_office_information
  def project_demand_form
    @demand = Project::Demand.find(params[:id])
    @demand_items = @demand.demand_items
    @fy = Project::FiscalYear.find(@demand.fiscal_year_id).fy
  end

  def purchase_order
    @purchase_order = Project::PurchaseOrder.find(params[:id])
    @purchase_order_items = @purchase_order.purchase_order_items
    @fy =  Office::FiscalYear.find(@purchase_order.fiscal_year_id).fy
    @amount =  Project::PurchaseOrderItem.where(purchase_order_id: @purchase_order.id).sum(:amount)
    @vat = @amount * 0.13
    @total = @amount + @vat
  end

  def project_purchase_entry
    @project_purchase_entry = Project::PurchaseEntry.find(params[:id])
    @project_purchase_entry_items = @project_purchase_entry.purchase_entry_items
    @total_amount = @project_purchase_entry_items.sum(:total_amount)
    @amount = @project_purchase_entry_items.sum(:amount)
    @amount_without_vat = @project_purchase_entry_items.sum(:amount_without_vat)
    @vat = @project_purchase_entry_items.sum(:vat)
    @other_expense = @project_purchase_entry_items.sum(:other_expense)
  end

  def project_item_assistance_register
    @item_assistance_register =  Project::ItemAssistanceRegister.find(params[:id])
    @item_assistance_register_items = @item_assistance_register.item_assistance_register_items
  end

  def project_release
    @project_release = Project::Release.find(params[:id])
    @project_release_items = @project_release.release_items
  end


  def oeirt_ledger
    @items = Project::Item.joins(:item_transactions)
                 .where("project_transactions.project_id = #{current_project.id}")
                 .where("project_transactions.user_id = #{current_project.id}")
                 .where("project_transactions.fiscal_year_id = #{current_project.id}")
                 .where(item_classification_no: 52)
                 .distinct(:item_id)
  end

  def oneirt_ledger
    @items = Project::Item.joins(:item_transactions)
                 .where("project_transactions.project_id = #{current_project.id}")
                 .where("project_transactions.user_id = #{current_project.id}")
                 .where("project_transactions.fiscal_year_id = #{current_project.id}")
                 .where(item_classification_no: 47)
                 .distinct(:item_id) end

  def project_handover_form
    @project_handover_form = Project::HandoverForm.find(params[:id])
    @project_handover_form_items = @project_handover_form.handover_form_items
  end

  def personnels
    @personnels =  Project::Personnel.where(user_id: current_user.id).where(project_id: current_project.id).where(fiscal_year_id: current_fiscal_year)
  end


  def vendors
    @vendors =  Project::Vendor.where(user_id: current_user.id).where(project_id: current_project.id).where(fiscal_year_id: current_fiscal_year)
  end

  def repair_application_form
    @repair_application_form =  Project::RepairApplicationForm.find(params[:id])
    @repair_application_form_items = @repair_application_form.repair_application_form_items
  end

  def project_purchase_entry
    @project_purchase_entry = Project::Tender.find(params[:id])
    @project_purchase_entry_items = @project_purchase_entry.project_tender_items
    @total_amount = @project_purchase_entry_items.sum(:total_amount)
    @amount = @project_purchase_entry_items.sum(:amount)
    @amount_without_vat = @project_purchase_entry_items.sum(:amount_without_vat)
    @vat = @project_purchase_entry_items.sum(:vat)
    @other_expense = @project_purchase_entry_items.sum(:other_expense)
  end


  def project_eitem_transactions
    project_item_id = params[:project_item_id]
    @item = Project::Item.find(project_item_id)
    @transactions = Project::Peirt.where(item_id: @item.item_id).where(project_id: nil)
  end
  private
  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @user = current_user
    @cb = current_control_body
  end
end
