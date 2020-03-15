include ModelHelper
include ApplicationHelper
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery

  rescue_from Exception do |exception|
    flash[:error] = "#{exception_message exception}"
    logger.debug("#{exception.class.to_s}: #{exception.message}")
    redirect_to request.referrer || root_path
  end


  private

  def current_office
    current_user.office
  end

  def current_control_body
    store_body = Office::StoreBody.new
    if current_office.store_bodies.empty?
      redirect_to new_store_body_path
    else
      store_body = current_office.store_bodies.last
    end
    store_body
  end

  def current_fiscal_year
    cfy = false
    if user_signed_in?
      cfy = Office::FiscalYear.find(current_office.active_fiscal_year.fiscal_year_id)
    end
    cfy
  end

  def after_sign_in_path_for(resource_or_scope)
    #check if office has been created for user
    url = '/'
    if resource_or_scope.office.blank?
      url = new_office_office_path
    end
    #check if office has fiscal year
    if resource_or_scope.office.blank? == false
      if current_office.fiscal_years.blank?
        url = new_office_fiscal_year_path
      end
    end
    url
  end

  def set_current_information object
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object.user_id = current_user.id
    object
  end

  def exception_message exception
    {
        "ActiveRecord::RecordNotFound" => "तपाईले खोज्नु भएको रेकर्ड कुनै कागजातमा फेला परेन |",
        "CanCan::AccessDenied" => "तपाईलाई यो कार्य गर्न अनुमती छैन |",
        "ActiveRecord::StatementInvalid" => "डेटाबेस स्टेटमेन्ट एरर: #{exception.message}",
        "ActionView::Template::Error" => "टेम्प्लेट एरर: #{exception.message}",
        "NameError" => "नेम एरर: #{exception.message}",
        "NoMethodError" => "नो मेथड एरर: #{exception.message}"
    }[exception.class.to_s]

  end

  end
