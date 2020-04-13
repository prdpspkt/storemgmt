class Office::ActiveFiscalYearsController < ApplicationController
  load_and_authorize_resource except: [:create, :new]
  before_action :set_active_fiscal_year, only: [:update]
  def new
    @office = current_office
    if current_office.active_fiscal_year.blank?
      @active_fiscal_year = Office::ActiveFiscalYear.new
    else
      @active_fiscal_year = current_office.active_fiscal_year
    end
  end

  def create
    @active_fiscal_year = Office::ActiveFiscalYear.new(active_fiscal_year_params)
    @active_fiscal_year.office_id = current_office.id
    @active_fiscal_year.save!

    setup = current_user.setup
    setup.active_fiscal_year = true
    setup.save
    redirect_to "/"
  end

  def update
    @active_fiscal_year.update(active_fiscal_year_params)
    redirect_to "/"
  end

  private

  def set_active_fiscal_year
    @active_fiscal_year = Office::ActiveFiscalYear.find(params[:id])
  end
  def active_fiscal_year_params
    params.require(:office_active_fiscal_year).permit(:fiscal_year_id)
  end
end
