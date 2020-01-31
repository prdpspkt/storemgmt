# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all
    can  [:index, :edit, :update, :destroy], :all, user_id: user.id
    can [:index, :edit, :update, :destroy], FiscalYear, office_id: user.office.id
    can :create, :all
    (can :manage, :all) if user.is_admin == true

  end
end
