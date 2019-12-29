class ProjectPurchaseTendersController < ApplicationController
  before_action :set_project_purchase_tender, only: [:show, :edit, :update, :destroy, :mark_as_final]

  # GET /project_purchase_tenders
  # GET /project_purchase_tenders.json
  def index
    @project_purchase_tenders = ProjectPurchaseTender.all
  end

  # GET /project_purchase_tenders/1
  # GET /project_purchase_tenders/1.json
  def show
    @project_tender_item = ProjectTenderItem.new
    @project_tender_items = @project_purchase_tender.project_tender_items
  end

  # GET /project_purchase_tenders/new
  def new
    @project_purchase_tender = ProjectPurchaseTender.new
  end

  # GET /project_purchase_tenders/1/edit
  def edit
  end

  # POST /project_purchase_tenders
  # POST /project_purchase_tenders.json
  def create
    @project_purchase_tender = ProjectPurchaseTender.new(project_purchase_tender_params)
    @project_purchase_tender = update_general_information @project_purchase_tender
    respond_to do |format|
      if @project_purchase_tender.save
        format.html { redirect_to @project_purchase_tender, notice: 'Project purchase tender was successfully created.' }
        format.json { render :show, status: :created, location: @project_purchase_tender }
      else
        format.html { render :new }
        format.json { render json: @project_purchase_tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_purchase_tenders/1
  # PATCH/PUT /project_purchase_tenders/1.json
  def update
    respond_to do |format|
      if @project_purchase_tender.update(project_purchase_tender_params)
        format.html { redirect_to @project_purchase_tender, notice: 'Project purchase tender was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_purchase_tender }
      else
        format.html { render :edit }
        format.json { render json: @project_purchase_tender.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_final
      if @project_purchase_tender.marked_as_final == true
        @project_purchase_tender.marked_as_final = false
      else
        @project_purchase_tender.marked_as_final = true
      end
    @project_purchase_tender.save
    redirect_to @project_purchase_tender
  end
  # DELETE /project_purchase_tenders/1
  # DELETE /project_purchase_tenders/1.json
  def destroy
    @project_purchase_tender.destroy
    respond_to do |format|
      format.html { redirect_to project_purchase_tenders_url, notice: 'Project purchase tender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_purchase_tender
      @project_purchase_tender = ProjectPurchaseTender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_purchase_tender_params
      params.require(:project_purchase_tender).permit(:tender_no, :tender_name, :tender_date, :marked_as_final, :bidders_name, :bidders_address)
    end

  def update_general_information object
    object.user_id = current_user.id
    object.office_id = current_office.id
    object.fiscal_year_id = current_fiscal_year.id
    object
  end
end
