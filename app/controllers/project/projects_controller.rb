class Project::ProjectsController < ProjectController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :demand, :release]
load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def index
    @projects = office(Project::Project)
    respond_to do |format|
      format.html
      format.xlsx
      format.json
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_items47 = Project::ProjectItem.where(project_id: @project.id).where(item_classification_no: 47)
    @project_items52 = Project::ProjectItem.where(project_id: @project.id).where(item_classification_no: 52)
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

  def release
    @release = Project::Release.new
    @release.project_id = @project.id
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project::Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project_project).permit(:name_of_project_ne, :name_of_project_en, :name_of_consumer_committee, :address, :phone_of_committee_representative, :name_of_committee_representative, :post_of_representative, :contractor, :phone_of_contractor_representative, :name_of_contractor_representative, :project_status)
    end

    def update_general_information object
      object.office_id = current_office.id
      object.user_id = current_user.id
      object.fiscal_year_id = current_fiscal_year.id
      object
    end
end
