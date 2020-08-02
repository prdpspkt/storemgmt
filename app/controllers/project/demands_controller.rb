class Project::DemandsController < ProjectController
  before_action :set_demand, only: [:show, :edit, :update, :destroy, :accept, :release, :print]
  load_and_authorize_resource except: [:create, :new]


  # GET /demands/1
  # GET /demands/1.json
  def show
    @demand_item = Project::DemandItem.new
    @demand_items = @demand.demand_items
    @items = @demand.project.project_items.joins(:project_item_transactions).distinct(:id).where("project_project_item_transactions.sku>0")
  end


  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Project::Demand.new(demand_params)
    @demand.recommended_by = Office::Personnel.find(demand_params[:recommended_by]).name_ne
    @demand = set_current_information @demand
    @demand.store_body_id = current_control_body.id
    @demand.demand_no = get_new_project_demand_no @demand.project_id
    @demand.marked_as_final = false
    @demand.entry_generated = false
    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render :new }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        @demand.recommended_by = Project::Personnel.find(demand_params[:recommended_by]).name_ne
        @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    project = @demand.project
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'माग फारम पूर्ण रुपले सफलतापुर्वक हटाईयो' }
      format.json { head :no_content }
    end
  end

  def accept
    if @demand.marked_as_final == true
      @demand.marked_as_final = false
    else
      @demand.marked_as_final = true
    end
    @demand.save
    redirect_to project_demand_path(@demand)
  end

  def release
    @demand_items = @demand.demand_items
    if @demand_items.count > 0
      create_release ##Create a project item release form
      @demand_items.each do |demand_item|
        transactions = Project::ProjectItemTransaction.where(:project_id => @demand.project_id).where(project_item_id: demand_item.project_item_id).where("sku > 0")
        transactions.each do |transaction|
          if transaction.sku > demand_item.quantity
            rate = transaction.amount / transaction.quantity
            data = {
                quantity:  demand_item.quantity,
                amount: rate * demand_item.quantity,
                project_item_id: demand_item.project_item_id,
                item_transaction_id: transaction.id,
                item_id: demand_item.item_id
            }
            create_release_item data
            transaction.sku = transaction.sku - demand_item.quantity
            transaction.save!
            break
          else
            rate = transaction.amount / transaction.quantity
            data = {
                quantity:  transaction.sku,
                amount: rate * transaction.sku,
                project_item_id: demand_item.project_item_id,
                item_transaction_id: transaction.id,
                item_id: demand_item.item_id
            }
            create_release_item(data)
            demand_item.quantity = demand_item.quantity - transaction.sku
            transaction.sku = 0
            transaction.save!
          end
        end
      end
    end
    @demand.entry_generated = true
    @demand.save!
    redirect_to @release
  end

  def print
    @demand_items = @demand.demand_items
    @fiscal_year = @demand.fiscal_year
    @office = @demand.office
    @report_name = "माग फाराम"
    @form_no = 401
    @old_form_no = 51
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Mag Pharam", layout: "pdf_print"
      end
    end
  end


  private


  # Use callbacks to share common setup or constraints between actions.
  def set_demand
    @demand = Project::Demand.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def demand_params
    params.require(:project_demand).permit(:project_id, :demand_no, :demand_date, :demand_by, :recommended_by, :recommended_date, :needed_to_purchase, :ordered_date, :recorded_date)
  end

  def create_release
    @release = Project::Release.new()
    @release = set_current_information @release
    @release.store_body_id = current_control_body.id
    @release.release_no = new_release_no @release.project_id
    @release.demand_id = @demand.id
    @release.project_id = @demand.project.id
    @release.release_date = @demand.demand_date
    @release.office_chief_signed_date = @demand.demand_date
    @release.store_keeper_signed_date = @demand.demand_date
    @release.accepted = false
    @release.entry_generated = false
    @release.save!
  end

  def create_release_item data
    release_item = Project::ReleaseItem.new(data)
    release_item.project_id = @demand.project_id
    release_item = set_current_information release_item
    release_item.release_id = @release.id
    release_item.save!
  end

  def get_new_project_demand_no project_id
    demand_no = 1
    @demands = current(Project::Demand).where(project_id: project_id)
    if @demands.count > 0
      demand_no = @demands.last.demand_no + 1
    end
    demand_no
  end

  def new_release_no project_id
    nrn = 1
    releases = current(Project::Release).where(project_id: project_id)
    if releases.count > 0
      nrn = releases.last.release_no + 1
    end
    nrn
  end

  def set_office_information
    @office = current_office
    @fiscal_year = current_fiscal_year
  end
end
