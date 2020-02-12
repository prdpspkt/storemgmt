class ProjectTenderBreakdown < ApplicationRecord
  belongs_to :office
  belongs_to :project_purchase_entry
  belongs_to :project
  has_many :project_tender_breakdown_items, dependent: :destroy
  after_update :create_peirt_or_pneirt

  private
  def create_peirt_or_pneirt
    if self.marked_as_final == true
      items = self.project_tender_breakdown_items
      items.each do |item|
        project_item_id = create_project_item_if_doesnt_exists item.item_id
        if item.item_classification_no == 52
          peirt = Peirt.new({
                                "project_item_id" => project_item_id,
                                "project_id" => self.project_id,
                                "item_id" => item.item_id,
                                "office_id" => item.office_id,
                                "fiscal_year_id" => item.fiscal_year_id,
                                "user_id" => item.user_id,
                                "transaction_date" => bs_today,
                                "transaction_type" => 1,
                                "rate" => item.rate,
                                "quantity" => item.quantity,
                                "amount" => item.total_amount,
                                "project_tender_breakdown_item_id" => item.id,
                                "sku" => item.sku,
                                "entry_release_no" => self.project_purchase_entry.entry_no
                            })
          peirt.save
        end
        if item.item_classification_no == 47
          pneirt = Pneirt.new({
                                  "project_item_id" => project_item_id,
                                  "project_id" => self.project_id,
                                  "model_no" => item.model_no,
                                  "item_identification_no" => item.item_identification_no,
                                  "country" => item.country,
                                  "item_id" => item.item_id,
                                  "office_id" => item.office_id,
                                  "fiscal_year_id" => item.fiscal_year_id,
                                  "user_id" => item.user_id,
                                  "transaction_date" => bs_today,
                                  "transaction_type" => 1,
                                  "rate" => item.rate,
                                  "quantity" => item.quantity,
                                  "amount" => item.total_amount,
                                  "project_tender_breakdown_item_id" => item.id,
                                  "sku" => item.sku,
                                  "entry_release_no" => self.project_purchase_entry.entry_no,
                                  "size" => item.size,
                                  "approx_age" =>item.approx_age,
                                  "source" => item.source,
                              })
          pneirt.save
        end
      end
    end
  end


  def create_project_item_if_doesnt_exists item_id
    @item = Item.find(item_id)
    @pi = ProjectItem.where(item_id: item_id).where(fiscal_year_id: self.fiscal_year_id).first
    if @pi.blank?
      @project_item = ProjectItem.new
      @project_item.item_register_page_no = generate_item_register_no
      @project_item.name_of_item_ne = @item.name_of_item_ne
      @project_item.name_of_item_en = @item.name_of_item_en
      @project_item.unit_ne = @item.unit_ne
      @project_item.item_id = @item.id
      @project_item.unit_en = @item.unit_en
      @project_item.model_no = @item.model_no
      @project_item.project_id = self.project_id
      @project_item.item_identification_no = @item.item_identification_no
      @project_item.office_id = self.office_id
      @project_item.fiscal_year_id = self.fiscal_year_id
      @project_item.save
      @pi = @project_item
    end
    @pi.id
  end
  def generate_item_register_no
    item_register_no = 1
    items = ProjectItem.where(fiscal_year_id: self.fiscal_year_id).where(project_id: nil)
    if items.count > 0
      item_register_no = items.last.item_register_no + 1
    end
    item_register_no
  end
  def bs_today
    date = Date.today()
    y = date.year
    m = date.month
    d = date.day
    bs = NepaliDateConverter::Convert.to_nepali(y, m, d)
    "#{bs[:year]}-#{bs[:month]}-#{bs[:date]}"
  end
end
