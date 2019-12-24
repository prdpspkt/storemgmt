class ReportController < ApplicationController
  before_action :set_office_information
  def office_demand_form
    @demand = Demand.find(params[:id])
    @demand_items = @demand.demand_items
    @fy = FiscalYear.find(@demand.fiscal_year_id).fy
  end

  def purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order_items = @purchase_order.purchase_order_items
    @fy = FiscalYear.find(@purchase_order.fiscal_year_id).fy
    @amount = PurchaseOrderItem.where(purchase_order_id: @purchase_order.id).sum(:amount)
    @vat = @amount * 0.13
    @total = @amount + @vat
  end

  def office_purchase_entry
    @office_purchase_entry = OfficePurchaseEntry.find(params[:id])
    @office_purchase_entry_items = @office_purchase_entry.office_purchase_entry_items
    @total_amount = @office_purchase_entry_items.sum(:total_amount)
    @amount = @office_purchase_entry_items.sum(:amount)
    @amount_without_vat = @office_purchase_entry_items.sum(:amount_without_vat)
    @vat = @office_purchase_entry_items.sum(:vat)
    @other_expense = @office_purchase_entry_items.sum(:other_expense)
  end

  def office_item_assistance_register
    @item_assistance_register = ItemAssistanceRegister.find(params[:id])
    @item_assistance_register_items = @item_assistance_register.item_assistance_register_items
  end

  def office_release
    @office_release = OfficeRelease.find(params[:id])
    @office_release_items = @office_release.office_release_items
  end


  def oeirt_ledger
    @items = OfficeItem.where(office_id: @office.id).where(fiscal_year_id: @fiscal_year.id).where(item_classification_no: 52)
  end

  def oneirt_ledger
    @items = OfficeItem.where(office_id: @office.id).where(item_classification_no: 47)
  end

  def office_handover_form
    @office_handover_form = OfficeHandoverForm.find(params[:id])
    @office_handover_form_items = @office_handover_form.office_handover_form_items
  end

  def personnels
    @personnels = Personnel.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year)
  end


  def vendors
    @vendors = Vendor.where(user_id: current_user.id).where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year)
  end

  def repair_application_form
    @repair_application_form = RepairApplicationForm.find(params[:id])
    @repair_application_form_items = @repair_application_form.repair_application_form_items
  end
  private
  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
    @usesr = current_user
    #TODO: Store these variables in a table and relate table to each of documents so each
    # document has different information that doesn't  affect data to next fiscal year
    @store_keeper = current_store_keeper
    @office_chief = current_office_chief
    @section_chief = current_office_chief
  end
end
