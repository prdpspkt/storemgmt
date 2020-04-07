# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    user = current_user || User.new
    cannot :manage, :all
    can :create, :all
    can [:view, :show, :edit, :destroy, :update, :index], Office::Office, user_id: user.id
    can :manage, [Office::Item,
                  Office::ItemCategory,
                  Office::PurchaseOrder,
                  Office::PurchaseOrderItem,
                  Office::PurchaseEntry,
                  Office::PurchaseEntryItem,
                  Office::Release,
                  Office::ReleaseItem,
                  Office::Demand,
                  Office::DemandItem,
                  Office::Personnel,
                  Office::Vendor,
                  Office::ActiveFiscalYear,
                  Office::ItemTransaction,
                  Office::HandoverForm,
                  Office::HandoverFormItem,
                  Office::ItemAssistanceRegister,
                  Office::ItemAssistanceRegisterItem,
                  Office::RepairApplicationForm,
                  Office::RepairApplicationFormItem,
                  Office::RepairRecordRegister,
                  Office::RepairRecordRegisterItem,
                  Office::StoreBody,
                  Office::ItemEvaluationCommittee,
                  Office::ItemEvaluationCommitteeMember,
                  Office::ItemEvaluation,
                  Office::ItemEvaluationItem,
                  Office::Stock,
                  Office::StockItem,
                  Office::LandAndStructureRecordBook,
                  Office::LandAndStructureRecordBookItem,
                  Office::RentalRecordRegister,
                  Office::RentalRecordRegisterItem,
                  Office::ItemDisposal,
                  Office::ItemDisposalItem
    ], user_id: user.id

    can :manage,  Office::FiscalYear, office_id: user.office_id

    if user.is_admin == true
      can :manage, User
    end

    if user.office.has_project_access == true
      can [:view, :show, :edit, :destroy, :update, :index], Project, user_id: user.id
      can :manage, [Project::Item,
                    Project::Project,
                    Project::ItemCategory,
                    Project::PurchaseOrder,
                    Project::PurchaseOrderItem,
                    Project::PurchaseEntry,
                    Project::PurchaseEntryItem,
                    Project::Release,
                    Project::ReleaseItem,
                    Project::Demand,
                    Project::DemandItem,
                    Project::ItemTransaction,
                    Project::HandoverForm,
                    Project::HandoverFormItem,
                    Project::ProjectPurchaseEntry,
                    Project::ProjectPurchaseEntryItem,
                    Project::Stock,
                    Project::StockItem,
                    Project::ItemEvaluation,
                    Project::ItemEvaluationItem
      ], user_id: user.id
    end
  end
end
