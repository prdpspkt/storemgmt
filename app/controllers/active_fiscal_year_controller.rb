class ActiveFiscalYearController < ApplicationController
  def new
    if current_office.active_fiscal_year.blank?
      @active_fiscal_year = ActiveFiscalYear.new
    else
      @active_fiscal_year = current_office.active_fiscal_year
    end
  end

  def create

  end
end
