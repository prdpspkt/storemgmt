class OfficeController < ApplicationController
  before_action :check_user


  private
  def check_user
    if current_user.is_admin
      redirect_to admin_dashboard_url
    end
  end
end