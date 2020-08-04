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

private
  def status_changed
  	if self.project_status == 1
      if self.office.completed_repair_project_id.present?
        move_items_completed_repair
      else
        errors[:base] << "सम्पन्न मर्मत आयोजना एकिन गरिएको छैन, कार्यालय सेटिंग भित्र गई सम्पन्न मर्मत आयोजना छान्नुहोस् |"
      end
    end
  end

  def move_items_completed_repair
  	items = self.project_items
    items.each do |item|
        trs = Project::ProjectItemTransaction.where(office_id: self.office_id).where(project_id: self.id).where(project_item_id: item.id).where("sku>0")
        trs.each do |tr|
            new_tr = Project::ProjectItemTransaction.new(tr.attributes)
            new_tr.id = nil
            new_tr.transaction_date = bs_today
            new_tr.transaction_type = 1
            new_tr.quantity = tr.sku
            new_tr.rate = tr.rate
            new_tr.amount = new_tr.rate * new_tr.amount
            new_tr.fiscal_year_id = self.office.active_fiscal_year.fiscal_year_id
            new_tr.project_id = self.office.completed_repair_project_id
            new_tr.project_item_id = create_project_item(new_tr, tr).id
            new_tr.remarks = "#{self.name_of_project_ne} सम्पन्न भई प्राप्त"
            if new_tr.save!
              tr.sku = 0
              tr.save
            else
            end

        end
       end
  end

def create_project_item new_tr, tr
    project_item = Project::ProjectItem.where(office_id: self.office_id)
              .where(project_id: new_tr.project_id)
              .where(fiscal_year_id: tr.fiscal_year_id)
              .where(item_id: tr.item_id).first
              binding.pry
    if project_item.blank? 
        item = Project::Item.find(tr.item_id)
        project_item = Project::ProjectItem.new(item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
        project_item.id = nil
        project_item.project_id = new_tr.project_id
        project_item.item_id = tr.item_id
        project_item.fiscal_year_id = new_tr.fiscal_year_id
        project_item.office_id = self.office_id
        project_item.user_id = self.user_id
        project_item.item_register_page_no = new_item_register_page_no new_tr.project_id
        project_item.save
    end
    project_item
  end

  def new_item_register_page_no project_id
    items = Project::Project.find(project_id).project_items
    item_register_page_no = 1
    unless items.blank?
      if item_register_page_no = items.last.item_register_page_no.present?
        item_register_page_no = items.last.item_register_page_no + 1
      end
    end
    item_register_page_no
  end
end
