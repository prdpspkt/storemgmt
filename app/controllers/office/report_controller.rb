class Office::ReportController < ApplicationController
  before_action :set_office_information
  load_and_authorize_resource
  def office_demand_form
    @demand = Office::Demand.find(params[:id])
    @demand_items = @demand.demand_items
    @fy = Office::FiscalYear.find(@demand.fiscal_year_id).fy
  end

  def purchase_order
    @purchase_order = Office::PurchaseOrder.find(params[:id])
    @purchase_order_items = @purchase_order.purchase_order_items
    @fy =  Office::FiscalYear.find(@purchase_order.fiscal_year_id).fy
    @amount =  Office::PurchaseOrderItem.where(purchase_order_id: @purchase_order.id).sum(:amount)
    @vat = @amount * 0.13
    @total = @amount + @vat
  end

  def office_purchase_entry
    @office_purchase_entry = Office::PurchaseEntry.find(params[:id])
    @office_purchase_entry_items = @office_purchase_entry.purchase_entry_items
    @total_amount = @office_purchase_entry_items.sum(:total_amount)
    @amount = @office_purchase_entry_items.sum(:amount)
    @amount_without_vat = @office_purchase_entry_items.sum(:amount_without_vat)
    @vat = @office_purchase_entry_items.sum(:vat)
    @other_expense = @office_purchase_entry_items.sum(:other_expense)
  end

  def office_item_assistance_register
    @item_assistance_register =  Office::ItemAssistanceRegister.find(params[:id])
    @item_assistance_register_items = @item_assistance_register.item_assistance_register_items
  end

  def office_release
    @office_release = Office::Release.find(params[:id])
    @office_release_items = @office_release.release_items
  end


  def oeirt_ledger
    @items = Office::Item.joins(:item_transactions).where("office_transactions.sku > 0").where(item_classification_no: 52).distinct(:item_id)
  end

  def oneirt_ledger
    @items = Office::Item.joins(:item_transactions).where("office_transactions.sku > 0").where(item_classification_no: 47).distinct(:item_id)
  end

  def office_handover_form
    @office_handover_form = Office::HandoverForm.find(params[:id])
    @office_handover_form_items = @office_handover_form.office_handover_form_items
  end

  def personnels
    @personnels =  Office::Personnel.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year)
  end


  def vendors
    @vendors =  Office::Vendor.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year)
  end

  def repair_application_form
    @repair_application_form =  Office::RepairApplicationForm.find(params[:id])
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
    @usesr = current_user
    #TODO: Store these variables in a table and relate table to each of documents so each
    # document has different information that doesn't  affect data to next fiscal year
   @cb = current_control_body
  end
end
