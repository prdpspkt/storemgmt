class ProjectItem < ApplicationRecord
  belongs_to :item
  has_many :peirt
  has_many :pneirt
  has_many :project_release_items
  before_create :add_item_register_page_no
  validates :item_id, uniqueness: true
  validates :item_classification_no, numericality: true



  private

  def add_item_register_page_no
    if ProjectItem.count > 0
      self.item_register_page_no = ProjectItem.last.item_register_page_no + 1
    else
      self.item_register_page_no = 1
    end
  end
end
