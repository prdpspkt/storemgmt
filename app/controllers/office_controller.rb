class OfficeController < ApplicationController
  before_action :check_user
  before_action :notifications


  private
  def check_user
    if current_user.is_admin
      redirect_to admin_dashboard_url
    end
  end

   def notifications
    @notifications = Notification.where(expired: false).where(created_for: [current_user.id, 0])
    @notifications.each do |notification|
        if notification.end_date <= bs_today
          notification.expired = true
          notification.save
        end
      end
    end
end