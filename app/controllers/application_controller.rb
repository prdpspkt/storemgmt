include ModelHelper
include ApplicationHelper
class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  protect_from_forgery
  # if Rails.env == "production"
  #   rescue_from Exception do |exception|
  #     flash[:error] = "#{exception_message exception}"
  #     logger.debug("#{exception.class.to_s}: #{exception.message}")
  #     redirect_to request.referrer || root_path
  #   end
  # end


  private

  def current_office
    current_user.office
  end


  def current_fiscal_year
    Office::FiscalYear.find(current_office.active_fiscal_year.fiscal_year_id)
  end

  def current_control_body
   current_office.store_bodies.last
  end



  def set_current_information object
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object.user_id = current_user.id
    object.store_body_id = current_control_body.id
    object
  end


  def exception_message exception
    {
        "ActiveRecord::RecordNotFound" => "तपाईले खोज्नु भएको रेकर्ड कुनै कागजातमा फेला परेन |",
        "CanCan::AccessDenied" => "तपाईलाई यो कार्य गर्न अनुमती छैन |",
        "ActiveRecord::StatementInvalid" => "डेटाबेस स्टेटमेन्ट एरर: #{exception.message}",
        "ActionView::Template::Error" => "टेम्प्लेट एरर: #{exception.message}",
        "NameError" => "नेम एरर: #{exception.message}",
        "NoMethodError" => "नो मेथड एरर: #{exception.message}",
        "ActionController::RoutingError" => "४०४ एररोर: पेज भेटिएन"
    }[exception.class.to_s]

  end



  def has_office? user
    if user.office.blank? == false
      true
    else
      false
    end
  end

  def has_fiscal_year? office
    if office.fiscal_years.count > 0
      true
    end
  end

  def has_active_fiscal_year? office
    if office.active_fiscal_year.blank? == false
      true
    else
      false
    end
  end

  def has_store_body? office
    if current_fiscal_year.store_bodies.count > 0
      true
    else
      false
    end
  end

end
