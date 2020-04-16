class SetupController < ApplicationController
  before_action :check_user
  def start
    @action_url = "/"
    if current_user.setup.blank? == false
      @setup = current_user.setup
      if @setup.complete
        @action_url = office_dashboard_url
      else
        office_setup
      end
    else
      create_setup
    end
    redirect_to @action_url and return
  end

  private

  def create_setup
    setup = Setup.new
    setup.office = false
    setup.fiscal_year = false
    setup.active_fiscal_year = false
    setup.store_body = false
    setup.user_id = current_user.id
    setup.save
    @setup = setup
    office_setup
  end

  def office_setup
    if @setup.office
     fiscal_year_setup
    else
     @action_url = new_office_office_url
    end
  end

  def fiscal_year_setup
   @setup.office = true
   @setup.save
   if @setup.fiscal_year
    active_fiscal_year_setup
   else
    @action_url = new_office_fiscal_year_url
   end
  end

  def active_fiscal_year_setup
   @setup.fiscal_year = true
   @setup.save
    if @setup.active_fiscal_year
     setup_store_body
    else
     @action_url = new_office_active_fiscal_year_url
    end
  end

  def setup_store_body
   @setup.active_fiscal_year = true
   @setup.save
   if @setup.store_body
    finalize_setup
   else
    @action_url = new_office_store_body_url
   end
  end

 def finalize_setup
  @setup.store_body = true
  @setup.complete = true
  @setup.save
  @action_url = office_dashboard_url
 end


  def check_user
    if current_user.is_admin == true
        redirect_to admin_dashboard_url and return
    end
  end

end
