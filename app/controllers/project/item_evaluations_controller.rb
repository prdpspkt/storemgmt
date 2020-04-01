class Project::ItemEvaluationsController < ProjectController
  before_action :set_project_item_evaluation, only: [:show, :update]
  load_and_authorize_resource except: [:create, :new]

  def index
    @item_evaluations = Project::ItemEvaluation.all
  end


  # GET /project_item_evaluations/1
  # GET /project_item_evaluations/1.json
  def new
    @item_evaluation = Project::ItemEvaluation.new
    @item_evaluation_committees = current(Office::ItemEvaluationCommittee)
  end

  def show
    @item_evaluation_items = Project::ItemEvaluationItem.where(item_evaluation_id: @item_evaluation.id)
        .order("id ASC")
  end


  def generate
      data = {
          name: item_evaluation_params[:name],
          committee_id: item_evaluation_params[:item_evaluation_committee_id],
          office_id: current_office.id,
          user_id: current_user.id,
          fiscal_year_id: current_fiscal_year.id
      }
      GenerateItemEvaluationForm.perform_async(data)
    redirect_to project_item_evaluations_url, notice: "जिन्सी निरीक्षण कार्य हुँदै छ, कृपया केहि समय पछि यो पेज रिफ्रेस गर्नु होस्, धन्यवाद |"
  end

  private



  # Use callbacks to share common setup or constraints between actions.
  def set_project_item_evaluation
    @item_evaluation = Project::ItemEvaluation.find(params[:id])
  end

  def item_evaluation_params
    params.require(:project_item_evaluation).permit(:name, :item_evaluation_committee_id)
  end

end
