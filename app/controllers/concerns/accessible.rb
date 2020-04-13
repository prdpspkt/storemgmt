module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  private
  def check_user
    if current_admin
      flash.clear
      redirect_to
    end
  end
end
