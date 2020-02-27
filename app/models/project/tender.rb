class ProjectTender < ApplicationRecord
  has_many :project_tender_items, dependent: :destroy
  belongs_to :office
  has_one :project_purchase_entry
  after_update :create_entry

  private
  def create_entry
    items = self.project_tender_items
    if self.entry_generated == true
      items.each do |item|
        if item.item_classification_no == 47
          create_pteits item
        end
        if item.item_classification_no == 52
          create_ptneits item
        end
      end
    end
  end


  def create_pteits item
    pteits = Project::Pteit.new(item.attributes.select{|key, _| Project::Pteit.column_names.include? key})
    pteits.id = nil
    pteits.project_tender_item_id = item.id
    pteits.save
  end

  def create_ptneits item
    pteits = Project::Ptneit.new(item.attributes.select{|key, _| Project::Ptneit.column_names.include? key})
    pteits.id = nil
    pteits.project_tender_item_id = item.id
    pteits.save
  end
end
