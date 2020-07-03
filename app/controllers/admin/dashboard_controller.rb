class Admin::DashboardController < AdminController
  def index
    @users = User.includes(:office)
  end

  def sign_in_as_user
  	 if current_user.is_admin == true
  	 	sign_in( :user, User.find(params[:id]) )
  	 	redirect_to root_path
  	 end
  end
end