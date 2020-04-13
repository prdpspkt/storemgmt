class Admin::DashboardController < AdminController
  def index
    @users = User.all
  end
end