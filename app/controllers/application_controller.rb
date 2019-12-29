class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	# protect_from_forgery
  #check_authorization unless: :devise_controller?
	# rescue_from CanCan::AccessDenied do |exception|
 #    respond_to do |format|
 #      format.json { head :forbidden, content_type: 'text/html' }
 #      format.html { redirect_to main_app.root_url, notice: exception.message }
 #      format.js   { head :forbidden, content_type: 'text/html' }
 #    end
  # end
  #
  #
 def after_sign_in_path_for(user)
   #check if office has been created for user
   url = '/'
   if current_user.office.blank?
    url = new_office_path
   end
   #check if office has fiscal year
   if current_user.office.blank? == false
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
  def current_office
    cf = Office.new
    if user_signed_in?
      if current_user.office.blank? != true
        cf = current_user.office
      end
    end
    cf
  end

  def current_fiscal_year
    cfy = false
    if user_signed_in?
      cfy = FiscalYear.find(current_office.active_fiscal_year.fiscal_year_id)
    end
    cfy
  end


  def current_office_chief
    office_chief = Personnel.new
    if current_fiscal_year.office.blank? == false
      office_chief = current_user.office.office_chief
    end
    office_chief
  end

  def current_store_keeper
    store_chief = Personnel.new
   if current_user.office.blank? == false
     store_chief = current_user.office.store_chief
   end
    store_chief
  end

  def current_section_chief
    section_chief = Personnel.new
    if  current_user.office.blank? == false
      section_chief = current_user.office.section_chief
    end
  end
end

#TODO Remove all unnessary methods from items controllers