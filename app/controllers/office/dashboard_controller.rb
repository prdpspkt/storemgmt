class Office::DashboardController < OfficeController

  def index
    @office = current_office
    @fiscal_year = current_fiscal_year
    @bs_today = bs_today
    @control_body = current_control_body
  end

end
