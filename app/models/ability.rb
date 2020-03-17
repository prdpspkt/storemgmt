# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    user = current_user || User.new
    cannot :manage, :all
    can :create, :all
    can [:view, :show, :edit, :destroy, :update, :index], Office, user_id: user.id
    can :manage, Office::Item, user_id: user.id
    can :manage, Office::ItemCategory, user_id: user.id
    can :manage, Office::PurchaseOrder, user_id: user.id
    can :manage, Office::PurchaseOrderItem, user_id: user.id
    can :manage, Office::PurchaseEntry, user_id: user.id
    can :manage, Office::PurchaseEntryItem, user_id: user.id
    can :manage, Office::Release, user_id: user.id
    can :manage, Office::ReleaseItem, user_id: user.id
    can :manage, Office::Demand, user_id: user.id
    can :manage, Office::DemandItem, user_id: user.id
    can :manage, Office::Personnel, user_id: user.id
    can :manage, Office::Vendor, user_id: user.id
    can :manage, Office::FiscalYear, user_id: user.id
    can :manage, Office::ActiveFiscalYear, user_id: user.id
    can :manage, Office::ItemTransaction, user_id: user.id
    can :manage, Office::HandoverForm, user_id: user.id
    can :manage, Office::HandoverFormItem, user_id: user.id
    can :manage, Office::ItemAssistanceRegister, user_id: user.id
    can :manage, Office::ItemAssistanceRegisterItem, user_id: user.id
    can :manage, Office::RepairApplicationForm, user_id: user.id
    if user.is_admin == true
      can :manage, User
    end
  end
end
