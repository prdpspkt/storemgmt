class Project::ProjectsController < ProjectController
  before_action :set_project, only: [:show,
                                     :edit,
                                     :update,
                                     :destroy,
                                     :demand,
                                     :release,
                                     :sapati,
                                     :sapati_create,
                                     :expense_item_register,
                                     :non_expense_item_register,
                                     :print_pdf_expense_item_register,
                                     :print_pdf_non_expense_item_register,
                                     :download_pdf_expense_item_register,
                                     :download_pdf_non_expense_item_register]
  load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def index
    @projects = office(Project::Project)
    respond_to do |format|
      format.html
      format.xlsx
      format.json
      format.pdf do
        @office = current_office
        @fiscal_year = current_fiscal_year
        @report_name = "संचालित आयोजनाको विवरण"
        render pdf: "running-projects", template: 'project/projects/index', orientation: "landscape", margin: {bottom: "12mm"}
      end
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_items47 = current(Project::ProjectItem).where(project_id: @project.id).where(item_classification_no: 47)
    @project_items52 = current(Project::ProjectItem).where(project_id: @project.id).where(item_classification_no: 52)
    @demands = @project.demands
    @releases = @project.releases
  end

  # GET /projects/new
  def new
    @project = Project::Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project::Project.new(project_params)
    @project = update_general_information @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def import
    file = params[:file]
    spreadsheet = case File.extname(file.original_filename)
                  when ".csv" then
                    Csv.new(file.path, nil, :ignore)
                  when ".xls" then
                    Roo::Excel.new(file.path, nil, :ignore)
                  when ".xlsx" then
                    Roo::Excelx.new(file.path)
                  else
                    flash[:error] = " अपलोड गरिएको फाइल <b> #{file.original_filename} </b> को पहिचान हुन सकेन |"
                    redirect_to project_projects_path and return
                  end
    header = spreadsheet.row(1)
    projects = (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      project = Project::Project.find_by_id(row["id"]) || Project::Project.new
      begin
        project.attributes = row.to_hash
      rescue Exception => error
        flash[:error] = "तपाईले अपलोड गर्नुभएको फाइलमा पहिचान नभएको कोलम हुन सक्छ त्यसलाई हटाएर पुन अपलोड गर्नुहोस् #{error.message}"
        redirect_to project_projects_path and return
      end
      project.office_id = current_office.id
      project.user_id = current_user.id
      project
    end
    if projects.map(&:valid?).all?
      projects.each(&:save!)
      true
    else
      projects.each_with_index do |project, index|
        project.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 6}: #{msg}"
        end
      end
      false
    end
    redirect_to project_projects_path
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def demand
    @demand = Project::Demand.new
    @demand.project_id = @project.id
  end


  def expense_item_register
    @generate_url = print_pdf_expense_item_register_project_project_url(@project)
    @download_url = download_pdf_expense_item_register_project_project_url(@project, format: :pdf)
    @report_name = "खर्च भएर जाने जिन्सी खाता"
    @items = current(Project::ProjectItem).where(project_id: @project.id).where(item_classification_no: 52)
    render 'item_register'
  end

  def non_expense_item_register
    @generate_url = print_pdf_non_expense_item_register_project_project_url(@project)
    @download_url = download_pdf_non_expense_item_register_project_project_url(@project, format: :pdf)
    @report_name = "खर्च भएर नजाने(खप्ने) जिन्सी खाता"
    @items = office(Project::ProjectItem).where(item_classification_no: 47)
    render 'item_register'
  end

  def print_pdf_expense_item_register
    ProjectProjectExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id, @project.id)
    redirect_to expense_item_register_project_project_url(@project), notice: "Your file is being generated in background please try print button after few minutes."
  end

  def print_pdf_non_expense_item_register
    ProjectProjectNonExpensableItemRegisterGenerator.perform_async(@office.id, @fiscal_year.id, current_control_body.id, @project.id)
    redirect_to non_expense_item_register_project_project_url(@project), notice: "Your file is being generated in background please try print button after few minutes."
  end

  def download_pdf_expense_item_register
    respond_to do |format|
      format.pdf do
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "#{@project.id}", "expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
        end
      end
    end
  end

  def download_pdf_non_expense_item_register
    respond_to do |format|
      format.pdf do
        pdf_path = Rails.root.join("pdfs", "#{@office.id}", "#{@fiscal_year.id}", "#{@project.id}", "non-expensable-item-register.pdf")
        if File.exists?(pdf_path)
          data = File.open(pdf_path, 'rb') { |io| io.read }
          send_data(data, type: 'application/pdf', disposition: :inline) and return
        end
      end
    end
  end

  def sapati
    @items = office(Project::Item)
  end

  def sapati_data
    @project_id = params[:id].to_i
    item_id = params[:item_id].to_i
    @quantity = params[:quantity].to_d
    @projects = office(Project::Project).where(project_status: 0)
    @data = []
    @projects.map do |project|
      quantity = office(Project::ProjectItemTransaction)
                     .where(project_id: project.id)
                     .where(fiscal_year_id: current_fiscal_year.id)
                     .where(item_id: item_id).where("sku > 0")
                     .sum(:sku)
      if quantity > 0
        @data.push({:name_of_project_ne => project.name_of_project_ne, :quantity => quantity, :from => project.id, :to => @project_id, :item_id => item_id})
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def sapati_create
    from_project_id = sapati_params[:from].to_i
    to_project_id = sapati_params[:to].to_i
    item_id = sapati_params[:item_id].to_i
    quantity = sapati_params[:quantity].to_d
    @quantity = quantity
    transactions = current(Project::ProjectItemTransaction).where(project_id: from_project_id).where(item_id: item_id).where("sku > 0")
    transactions.each do |tr|
      if quantity > 0
        if tr.sku >= quantity
          create_sapati_transaction tr, to_project_id, quantity
          create_sapati_record to_project_id, tr, quantity
          break;
        else
          create_sapati_transaction tr, to_project_id, tr.sku
          create_sapati_record to_project_id, tr, tr.sku
          quantity = quantity - tr.sku
        end
      else
        break;
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to project_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project::Project.find(params[:id])
    @office = current_office
    @fiscal_year = current_fiscal_year
    @cb = current_control_body
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project_project).permit(:name_of_project_ne, :name_of_project_en, :name_of_consumer_committee, :address, :phone_of_committee_representative, :name_of_committee_representative, :post_of_representative, :contractor, :phone_of_contractor_representative, :name_of_contractor_representative, :project_status)
  end

  def sapati_params
    params.require(:sapati).permit(:to, :from, :item_id, :quantity)
  end

  def update_general_information object
    object.office_id = current_office.id
    object.user_id = current_user.id
    object.fiscal_year_id = current_fiscal_year.id
    object
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
    ntr.remarks = "#{tr.project.name_of_project_ne} बाट सापटी"
    ntr.transaction_date = bs_today
    if ntr.save!
      create_sapati_expense_transaction tr, quantity, to_project
    end
  end

  def create_sapati_expense_transaction tr, quantity, to_project
    ntr = Project::ProjectItemTransaction.new(tr.attributes.select { |key, _| Project::ProjectItemTransaction.column_names.include? key })
    ntr.id = nil
    ntr = set_current_information ntr
    ntr.transaction_type = - 1
    ntr.quantity = quantity
    ntr.amount = ntr.rate * ntr.quantity
    ntr.sku = 0
    ntr.transaction_date = bs_today
    ntr.remarks = "#{Project::Project.find(to_project).name_of_project_ne} लाई सापटी"
    if ntr.save!
      tr.sku = tr.sku - quantity
      tr.save
    end
  end

  def create_sapati_record to, tr, quantity
    sapati_record = Project::SapatiRecord.new
    sapati_record.to_project = to
    sapati_record.from_project = tr.project_id
    sapati_record.item_id = tr.item_id
    sapati_record.project_item_id = get_project_item_id to, sapati_record.item_id
    sapati_record.quantity = quantity
    sapati_record = set_current_information sapati_record
    sapati_record.store_body_id = current_control_body.id
    sapati_record.sapati_returned = false
    sapati_record.save!
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
      project_item.item_register_page_no = new_item_register_page_no
      project_item.save!
    end
    project_item.id
  end

  def new_item_register_page_no
    project_items = office(Project::ProjectItem)
    irpn = 1
    if project_items.count > 0
      irpn = project_items.last.item_register_page_no + 1
    end
    irpn
  end
end
