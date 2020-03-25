class Project::TendersController < ProjectController
  before_action :set_tender, only: [:show, :edit, :update, :destroy, :accept, :entry]

  # GET /tenders
  # GET /tenders.json
  def index
    @tenders = current(Project::Tender)
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show
    @tender_item = Project::TenderItem.new
    @tender_items = @tender.tender_items
  end

  # GET /tenders/new
  def new
    @tender = Project::Tender.new
  end

  # GET /tenders/1/edit
  def edit
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Project::Tender.new(tender_params)
    @tender = update_general_information @tender
    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: 'Project purchase tender was successfully created.' }
        format.json { render :show, status: :created, location: @tender }
      else
        format.html { render :new }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenders/1
  # PATCH/PUT /tenders/1.json
  def update
    respond_to do |format|
      if @tender.update(tender_params)
        format.html { redirect_to @tender, notice: 'Project purchase tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @tender }
      else
        format.html { render :edit }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_final
    if @tender.marked_as_final == true
      @tender.marked_as_final = false
    else
      @tender.marked_as_final = true
    end
    @tender.save!
    redirect_to @tender
  end

  def generate_entry
    if @tender.entry_generated != true
      @tender.entry_generated = true
    else
      @tender.entry_generated  = false
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender.destroy
    respond_to do |format|
      format.html { redirect_to project_tenders_url, notice: 'Project purchase tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tender
    @tender = Project::Tender.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tender_params
    params.require(:project_tender).permit(:tender_no, :tender_name, :tender_date, :marked_as_final, :bidders_name, :bidders_address)
  end

  def update_general_information object
    object.user_id = current_user.id
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object.store_body_id = current_control_body.id
    object
  end

end
