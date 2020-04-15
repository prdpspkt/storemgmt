class AdminController < ApplicationController
  before_action :check_user

  private
  def check_user
    if current_user.is_admin == false
      redirect_to office_dashboard_url, notice: "Page you trying to access doesnt exists" and return
    end
  end
end
