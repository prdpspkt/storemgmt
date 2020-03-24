class Project::EvaluationItemsController < ProjectController
  before_action :set_project_evaluation_item, only: [:show, :edit, :update, :destroy]

  # GET /project_evaluation_items
  # GET /project_evaluation_items.json
  def index
    @project_evaluation_items = ProjectEvaluationItem.all
  end

  # GET /project_evaluation_items/1
  # GET /project_evaluation_items/1.json
  def show
  end

  # GET /project_evaluation_items/new
  def new
    @project_evaluation_item = ProjectEvaluationItem.new
  end

  # GET /project_evaluation_items/1/edit
  def edit
  end

  # POST /project_evaluation_items
  # POST /project_evaluation_items.json
  def create
    @project_evaluation_item = ProjectEvaluationItem.new(project_evaluation_item_params)

    respond_to do |format|
      if @project_evaluation_item.save
        format.html { redirect_to @project_evaluation_item, notice: 'Project evaluation item was successfully created.' }
        format.json { render :show, status: :created, location: @project_evaluation_item }
      else
        format.html { render :new }
        format.json { render json: @project_evaluation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_evaluation_items/1
  # PATCH/PUT /project_evaluation_items/1.json
  def update
    respond_to do |format|
      if @project_evaluation_item.update(project_evaluation_item_params)
        format.html { redirect_to @project_evaluation_item, notice: 'Project evaluation item was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_evaluation_item }
      else
        format.html { render :edit }
        format.json { render json: @project_evaluation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_evaluation_items/1
  # DELETE /project_evaluation_items/1.json
  def destroy
    @project_evaluation_item.destroy
    respond_to do |format|
      format.html { redirect_to project_evaluation_items_url, notice: 'Project evaluation item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_evaluation_item
      @project_evaluation_item = ProjectEvaluationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_evaluation_item_params
      params.require(:project_evaluation_item).permit(:item_classification_no, :item_register_page_no, :name_of_item_ne, :name_of_item_en, :unit_ne, :unit_en, :quantity, :amount, :mached, :unmatched, :decreased_quantity, :increased_quantity, :dein_quantity, :working, :not_working, :to_be_repaired, :to_be_auctioned, :to_be_dispose, :to_be_conserved, :total_amount, :remarks, :item_id, :project_item_id, :office_id, :user_id, :fiscal_year_id, :fy, :marked_as_final)
    end
end
