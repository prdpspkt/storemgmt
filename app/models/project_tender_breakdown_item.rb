class ProjectTenderBreakdownItem < ApplicationRecord
  belongs_to :project_tender_breakdown
  belongs_to :project_purchase_entry_item
  has_one :pneirt, dependent: :destroy
  has_one :peirt, dependent: :destroy

  after_destroy :delete_all_peirt_and_pneirt

  private
  def delete_all_peirt_and_pneirt
    self.peirt.destroy
    self.pneirt.destroy
  end
end
