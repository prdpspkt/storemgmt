class Project::Project < ApplicationRecord
  belongs_to :user
  has_many :project_items, class_name: "Project::ProjectItem"
  belongs_to :office, class_name: "Office::Office"
  has_many :demands, class_name: "Project::Demand"
  has_many :releases, class_name: "Project::Release"
  has_many :purchase_entry, class_name: "Project::PurchaseEntry"
  has_many :purchase_order, class_name: "Project::PurchaseOrder"
  has_many :project_item_transactions, :class_name => 'Project::ProjectItemTransaction'

  after_update :status_changed


  def status_changed
  	if self.project_status == 1
        move_items_completed_repair
  	end
  end

  def move_items_completed_repair
  	   items = self.project_items
       items.each do |item|
        trs = Project::ProjectItemTransaction.where(office_id: self.office_id).where(project_id: self.id).where(item_id: item.id).where("sku>0")
          trs.each do |tr|
            new_tr = Project::ProjectItemTransaction.new(tr.attributes)
            new_tr.id = nil
            new_tr.transaction_date = bs_today
            new_tr.transaction_type = 1
            new_tr.quantity = tr.sku
            new_tr.rate = tr.rate
            new_tr.amount = new_tr.rate * new_tr.amount
            new_tr.fiscal_year_id = self.office.active_fiscal_year.fiscal_year_id
            new_tr.project_id = self.office.completed_repair_id
            new_tr.project_item_id = create_project_item 
          end
       end
  end

    def create_project_item project_id, item_id, fiscal_year_id
    if project_item_exists(project_id, item_id) != false
      project_item = Project::ProjectItem.where(office_id: self.office_id)
              .where(project_id: project_id)
              .where(fiscal_year_id: fiscal_year_id)
              .where(item_id: item_id).first
    else
      item = Project::Item.find(item_id)
      project_item = Project::ProjectItem.new(item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
      project_item.id = nil
      project_item.project_id = project_id
      project_item.item_id = item_id
      project_item = set_current_information project_item
      project_item.item_category_id = item.item_category_id
      project_item.item_register_page_no = new_project_item_register_page_no project_id
      project_item.save
    end
    project_item
  end
end
