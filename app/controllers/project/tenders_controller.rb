class Project::TendersController < ProjectController
  before_action :set_project_tender, only: [:show, :edit, :update, :destroy, :mark_as_final, :generate_entry]

  # GET /project_tenders
  # GET /project_tenders.json
  def index
    @project_tenders = current(Project::Tender)

  end

  # GET /project_tenders/1
  # GET /project_tenders/1.json
  def show
    @project_tender_item = Project::TenderItem.new
    @project_tender_items = @project_tender.project_tender_items
  end

  # GET /project_tenders/new
  def new
    @project_tender = Project::Tender.new
  end

  # GET /project_tenders/1/edit
  def edit
  end

  # POST /project_tenders
  # POST /project_tenders.json
  def create
    @project_tender = Project::Tender.new(project_tender_params)
    @project_tender = update_general_information @project_tender
    respond_to do |format|
      if @project_tender.save
        format.html { redirect_to @project_tender, notice: 'Project purchase tender was successfully created.' }
        format.json { render :show, status: :created, location: @project_tender }
      else
        format.html { render :new }
        format.json { render json: @project_tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tenders/1
  # PATCH/PUT /project_tenders/1.json
  def update
    respond_to do |format|
      if @project_tender.update(project_tender_params)
        format.html { redirect_to @project_tender, notice: 'Project purchase tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_tender }
      else
        format.html { render :edit }
        format.json { render json: @project_tender.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_final
    if @project_tender.marked_as_final == true
      @project_tender.marked_as_final = false
    else
      @project_tender.marked_as_final = true
    end
    @project_tender.save!
    redirect_to @project_tender
  end

  def generate_entry
    if @project_tender.entry_generated != true
      @project_tender.entry_generated = true
    else
      @project_tender.entry_generated  = false
    end
  end

  # DELETE /project_tenders/1
  # DELETE /project_tenders/1.json
  def destroy
    @project_tender.destroy
    respond_to do |format|
      format.html { redirect_to project_tenders_url, notice: 'Project purchase tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project_tender
    @project_tender = Project::Tender.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_tender_params
    params.require(:project_tender).permit(:tender_no, :tender_name, :tender_date, :marked_as_final, :bidders_name, :bidders_address)
  end

  def update_general_information object
    object.user_id = current_user.id
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object.store_keeper_name = current_control_body.store_keeper_name
    object.store_keeper_designation = current_control_body.store_keeper_designation
    object.section_chief_name = current_control_body.section_chief_name
    object.section_chief_designation = current_control_body.section_chief_degination
    object.office_chief_name = current_control_body.office_chief_name
    object.office_chief_designation = current_control_body.office_chief_degination
    object
  end

end
