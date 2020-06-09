class ProjectController < ApplicationController
  layout "project"
  before_action :can_view_project_interface
  before_action :check_user


  private

  def can_view_project_interface
    if current_user.is_admin != true
      if current_office.has_project_access != true
        redirect_to root_path and return
      end
    else
      redirect_to admin_dashboard_path
    end
  end

  def check_user
    if current_user.is_admin
      redirect_to admin_dashboard_url
    end
  end
end