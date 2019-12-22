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

private
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def current_office
    cf = false
    if user_signed_in?
      cf = current_user.office
    end
    cf
  end

  def current_fiscal_year
    cfy = false
    if user_signed_in?
      cfy = FiscalYear.find(current_user.active_fiscal_year)
    end
    cfy
  end


  def current_office_chief
    Personnel.find(current_user.office.office_chief)
  end

  def current_store_keeper
    Personnel.find(current_user.office.store_chief)
  end

  def current_section_chief
    @personnel = Personnel.new
    if current_user.office.section_chief.blank? == false
      @name = Personnel.find(current_user.office.section_chief)
    end
    @personnel
  end

  def office_name
    current_user.office.office
  end
end

#TODO Remove all unnessary methods from items controllers