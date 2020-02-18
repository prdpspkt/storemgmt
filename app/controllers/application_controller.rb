include ModelHelper
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	protect_from_forgery
	rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end


 def after_sign_in_path_for(resource_or_scope)
   #check if office has been created for user
   url = '/'
   if resource_or_scope.office.blank?
    url = new_office_path
   end
   #check if office has fiscal year
   if resource_or_scope.office.blank? == false
     if current_office.fiscal_years.blank?
        url = new_fiscal_year_path
     end
   end
   url
 end

  private
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end

#TODO Remove all unnessary methods from items controllers