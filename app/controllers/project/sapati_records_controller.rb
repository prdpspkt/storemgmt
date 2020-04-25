class Project::SapatiRecordsController < ProjectController
  before_action :set_sapati_record, only: [:sapati_return]

  def index
    @sapati_records = current(Project::SapatiRecord).where(sapati_returned: false)
  end

  def sapati_return
    from_project_id = @sapati_record.to_project
    to_project_id = @sapati_record.from_project
    item_id = @sapati_record.item_id
    quantity = @sapati_record.quantity
    transactions = current(Project::ProjectItemTransaction).where(project_id: from_project_id).where(item_id: item_id).where("sku > 0")
    if transactions.sum(:sku) >= quantity
      transactions.each do |tr|
        if quantity > 0
          if tr.sku >= quantity
            create_sapati_transaction tr, to_project_id, quantity
            break;
          else
            create_sapati_transaction tr, to_project_id, tr.sku
            quantity = quantity - tr.sku
          end
        end
      end
    else
      redirect_to project_sapati_records_url, notice: "सापटी फिर्ता गर्न पर्याप्त मौज्दात देखिएन, कृपया मौज्दात दाखिला गरी पुन प्रयास गर्नुहोस्|" and return
    end
    @sapati_record.sapati_returned = true
    @sapati_record.save
    redirect_to project_sapati_records_url, notice: "सापटी फिर्ता गरियो |"
  end

  def sapati_print
    @office = current_office
    @fiscal_year = current_fiscal_year
    @report_name = "सोध भर्ना गर्न खरिद गर्नुपर्ने जिन्सी"
    @sapati_records = Project::SapatiRecord.where(sapati_returned: false).order("to_project asc")
    respond_to do |format|
      format.pdf do
        render pdf: "खरिद गर्नुपर्ने सामाग्री"
      end
    end
  end


  private

  def set_sapati_record
    @sapati_record = Project::SapatiRecord.find(params[:id])
  end

  def create_sapati_transaction tr, to_project, quantity
    ntr = Project::ProjectItemTransaction.new(tr.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
    ntr.id = nil
    ntr.project_id = to_project
    ntr.project_item_id = get_project_item_id to_project, tr.item_id
    ntr = set_current_information ntr
    ntr.transaction_type = 1
    ntr.quantity = quantity
    ntr.sku = quantity
    ntr.amount = ntr.rate * ntr.quantity
    ntr.remarks = "#{tr.project.name_of_project_ne} बाट सापटी फिर्ता"
    ntr.transaction_date = bs_today
    if ntr.save!
      create_sapati_expense_transaction tr, quantity, to_project
    end
  end

  def create_sapati_expense_transaction tr, quantity, to_project
    ntr = Project::ProjectItemTransaction.new(tr.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
    ntr.id = nil
    ntr = set_current_information ntr
    ntr.transaction_type = -1
    ntr.quantity = quantity
    ntr.amount = ntr.rate * ntr.quantity
    ntr.sku = 0
    ntr.transaction_date = bs_today
    ntr.remarks = "#{Project::Project.find(to_project).name_of_project_ne} लाई सापटी फिर्ता"
    if ntr.save!
      tr.sku = tr.sku - quantity
      tr.save
    end
  end

  def get_project_item_id project_id, item_id
    item = Project::Item.find(item_id)
    project_item = Project::ProjectItem.where(project_id: project_id)
                       .where(item_id: item_id)
                       .where(office_id: current_office.id).first
    if project_item.blank?
      project_item = Project::ProjectItem.new(item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
      project_item.id = nil
      project_item.project_id = project_id
      project_item.item_id = item.id
      project_item.save!
    end
    project_item.id
  end
end
