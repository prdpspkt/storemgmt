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

  def current_control_body
    store_body = StoreBody.new
    if current_office.store_bodies.empty?
      redirect_to new_store_body_path
    else
      store_body = current_office.store_bodies.last
    end
    store_body
  end

  def bs_today
    date = Date.today()
    y = date.year
    m = date.month
    d = date.day
    bs = NepaliDateConverter::Convert.to_nepali(y, m, d)
    "#{bs[:year]}-#{bs[:month]}-#{bs[:date]}"
  end
  
  
  def current object
    object.where(office_id: current_office.id).where(fiscal_year_id: current_fiscal_year.id)
  end

  def office object
    object.where(office_id: current_office.id)
  end
end

#TODO Remove all unnessary methods from items controllers