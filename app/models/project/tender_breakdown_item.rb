class Project::TenderBreakdownItem < ApplicationRecord
  belongs_to :tender_breakdown, class_name: "Project::TenderBreakdown"
  belongs_to :purchase_entry_item, "Project::PurchaseEntry"
  has_one :pneirt, dependent: :destroy
  has_one :peirt, dependent: :destroy

  after_destroy :delete_all_peirt_and_pneirt

  private
  def delete_all_peirt_and_pneirt
    self.peirt.destroy
    self.pneirt.destroy
  end
end
