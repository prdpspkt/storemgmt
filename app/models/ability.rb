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
    can :manage, Office::RepairApplicationFormItem, user_id: user.id
    can :manage, Office::RepairRecordRegister, user_id: user.id
    can :manage, Office::RepairRecordRegisterItem, user_id: user.id
    if user.is_admin == true
      can :manage, User
    end

    if user.office.has_project_access == true
      can [:view, :show, :edit, :destroy, :update, :index], Project, user_id: user.id
      can :manage, Project::Item, user_id: user.id
      can :manage, Project::Project, user_id: user.id
      can :manage, Project::ItemCategory, user_id: user.id
      can :manage, Project::PurchaseOrder, user_id: user.id
      can :manage, Project::PurchaseOrderItem, user_id: user.id
      can :manage, Project::PurchaseEntry, user_id: user.id
      can :manage, Project::PurchaseEntryItem, user_id: user.id
      can :manage, Project::Release, user_id: user.id
      can :manage, Project::ReleaseItem, user_id: user.id
      can :manage, Project::Demand, user_id: user.id
      can :manage, Project::DemandItem, user_id: user.id
      can :manage, Project::ItemTransaction, user_id: user.id
      can :manage, Project::HandoverForm, user_id: user.id
      can :manage, Project::HandoverFormItem, user_id: user.id
    end
  end
end
