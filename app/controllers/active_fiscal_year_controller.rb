class ActiveFiscalYearController < ApplicationController
  def new
    @office = current_office
    if current_office.active_fiscal_year.blank?
      @active_fiscal_year = ActiveFiscalYear.new
    else
      @active_fiscal_year = current_office.active_fiscal_year
    end
  end

  def create
    @active_fiscal_year = ActiveFiscalYear.find(params[:id])
    @active_fiscal_year.fiscal_year_id = params[:active_fiscal_year][:fiscal_year_id]
    @active_fiscal_year.save
    redirect_to "/"
  end
end
